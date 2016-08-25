/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000002750025243_3825569782_init();
    work_m_00000000001501409081_3037777339_init();
    work_m_00000000003633530539_2272228915_init();
    work_m_00000000002271827736_3254454142_init();
    work_m_00000000000776760261_2434379570_init();
    work_m_00000000003820870568_1937623580_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000003820870568_1937623580");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
