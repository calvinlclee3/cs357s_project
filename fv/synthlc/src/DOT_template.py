dot_header = '''
digraph G {
    edge [penwidth=2];
    node [ shape=box, fontsize=20, penwidth=2, fontname="roboto"];
    esep=0.5;
    layout=neato;
    overlap=scale;
    splines=true;
'''
label = '''
l_{nm} [label=\"{nm}\"; pos=\"0,-{loc}!\"; shape=none];
'''
uhb_node = '''
n_{nm} [label=\"\"; pos=\"2,-{loc}!\"; shape=circle ]; \n
'''
uhb_node_color = '''
n_{nm} [style=filled, color=black, fillcolor="{color}", label=\"\"; pos=\"2,-{loc}!\"; shape=circle ]; \n
'''
uhb_edge_label = '''
n_{u} -> n_{v} [color="{color}", label="{e_s}"];
'''
uhb_edge = '''
n_{u} -> n_{v} [color="{color}"];
'''
color_names = [
"#000000",
"#4B0082",
"#006400",
"#DA70D6",
"#6495ED",
"#2F4F4F",
"#F0E68C",
"#CD853F",
"#A52A2A",
"#00008B",
"#FFA500"
]
footer = '''

'''

list_rows = [
	"decode_s1",
	"execute_s1",
	"execute_s2",
	"execute_s3",
	"memory_s1",
	"memory_s2",
	"memory_s4",
	"memory_s5",
	"memory_s6",	
	"writeback_s11",
	"writeback_s2",
	"writeback_s4",
	"writeback_s6",
	"writeback_s9"
]
