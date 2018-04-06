
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name cache_final_1 -dir "C:/Xilinx projects/cache_final_1/planAhead_run_2" -part xc6slx45csg324-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Xilinx projects/cache_final_1/l1_top_level.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Xilinx projects/cache_final_1} {ipcore_dir} }
add_files [list {ipcore_dir/L1_block_ram.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/L1_cache_block.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/l1_lru0.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/l1_lru1.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/l1_lru2.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/l1_lru3.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/L2_cache_block.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/l2_lru0.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/l2_lru1.ncf}] -fileset [get_property constrset [current_run]]
set_property target_constrs_file "port_map.ucf" [current_fileset -constrset]
add_files [list {port_map.ucf}] -fileset [get_property constrset [current_run]]
link_design
