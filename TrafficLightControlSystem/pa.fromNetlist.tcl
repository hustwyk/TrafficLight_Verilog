
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name TrafficLightControlSystem2.0 -dir "C:/Users/WYK/Desktop/DC keshe/TrafficLightControlSystem2.0/planAhead_run_1" -part xc3s100ecp132-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/WYK/Desktop/DC keshe/TrafficLightControlSystem2.0/TopCtrl.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/WYK/Desktop/DC keshe/TrafficLightControlSystem2.0} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "TopCtrl.ucf" [current_fileset -constrset]
add_files [list {TopCtrl.ucf}] -fileset [get_property constrset [current_run]]
link_design
