// Post-trace: any instruction encoding but invalid
// Assume IUV issued at first cycle after reset
// Symbolic reset on the memory and regfile
`define INTRA_TRANSMITTER 

// =============================================================================
// Frontend-legal-setup (since we bbox) and processor in operation
// =============================================================================

//BBOX_AMO_REQ: assume property (@(posedge clock) 
//      commit_stage_i.amo_resp_i.ack == 1'b0);
//BRANCH: assume property (@(posedge clock) 
//      id_stage_i.fetch_entry_i.branch_predict.predict_address != pc0);

NON_EXCEPTION_FRONTEND: assume property (@(posedge clock)
  (id_xcpt == 1'b0)
  // tag this fetched instruction is not exceptioned already at front-end
  // (e.g., INSTR_PAGE_FAULT or INSTR_ACCESS_FAULT)
);

IF_ID_CONTRACT: assume property (@(posedge clock)
  // yet ack then hold
  (_ibuf_io_inst_0_valid && _ctrl_stalld_T_32) |=>
  (
  ($past(_ibuf_io_inst_0_valid) == _ibuf_io_inst_0_valid) &&
  ($past(_ibuf_io_inst_0_bits_inst_bits) == _ibuf_io_inst_0_bits_inst_bits) &&
  ($past(_ibuf_io_pc) == _ibuf_io_pc)
  )
);

IN_OP_MODE: assume property (@(posedge clock) reset == 1'd0);
NOHALT: assume property (@(posedge clock) _csr_io_csr_stall == 1'b0 && wb_reg_sfence == 1'b0);

// =============================================================================
// Set up instruction of interest 
// =============================================================================
wire [32-1:0] i0;
i0_const: assume property (@(posedge clock) CONST(i0));

// =============================================================================
// Set up pc value, instruction issue, and execution contexts
// =============================================================================
// (pc0, i0)
wire [39:0] pc0;

pc0_const: assume property (@(posedge clock) CONST(pc0));
pc0_nozero: assume property (@(posedge clock) pc0 != '0);

wire instn_begin = (_ibuf_io_inst_0_valid && 
                    _ibuf_io_pc == pc0);

pc0_i0_assoc_1: assume property (@(posedge clock) 
    _ibuf_io_pc == pc0 |-> _ibuf_io_inst_0_bits_inst_bits == i0);
pc0_i0_assoc_2: assume property (@(posedge clock) 
    _ibuf_io_pc == pc0 |-> 
    (_ibuf_io_inst_0_valid == 1'b1 && 
     _ibuf_io_inst_0_bits_xcpt0_pf_inst == 1'b0 &&
     _ibuf_io_inst_0_bits_xcpt0_gf_inst == 1'b0 &&
     _ibuf_io_inst_0_bits_xcpt0_ae_inst == 1'b0 &&
     _ibuf_io_inst_0_bits_xcpt1_pf_inst == 1'b0 &&
     _ibuf_io_inst_0_bits_xcpt1_gf_inst == 1'b0 &&
     _ibuf_io_inst_0_bits_xcpt1_ae_inst == 1'b0
    )
    // IF issuing a valid request, i.e. no exception raised so far at IF
);


NO_INSTN_INTERFERENCE_1: assume property (@(posedge clock) first |-> 
        instn_begin);
NO_INSTN_INTERFERENCE_2: assume property (@(posedge clock) first |=> 
    always !(_ibuf_io_inst_0_valid));

ISSUE_ONCE: assume property (@(posedge clock) instn_begin |=> 
        always !(_ibuf_io_pc == pc0));

NON_REPLAY: assume property (@(posedge clock) instn_begin |-> 
        !(_ibuf_io_inst_0_bits_replay));
