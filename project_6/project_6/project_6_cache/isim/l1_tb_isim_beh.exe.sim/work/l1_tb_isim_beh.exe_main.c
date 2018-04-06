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

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *STD_TEXTIO;
char *IEEE_P_3499444699;
char *IEEE_P_3620187407;
char *IEEE_P_1242562249;
char *IEEE_P_3564397177;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    std_textio_init();
    ieee_p_3564397177_init();
    xilinxcorelib_a_1185029652_2959432447_init();
    xilinxcorelib_a_0304767522_1709443946_init();
    xilinxcorelib_a_0282996449_0543512595_init();
    xilinxcorelib_a_1793200852_3212880686_init();
    work_a_2854457787_4282874944_init();
    work_a_0660113094_3212880686_init();
    xilinxcorelib_a_3615914639_2959432447_init();
    xilinxcorelib_a_2339741636_1709443946_init();
    xilinxcorelib_a_1843647146_0543512595_init();
    xilinxcorelib_a_2000927542_3212880686_init();
    work_a_0202576482_0154589107_init();
    xilinxcorelib_a_3823385712_0543512595_init();
    xilinxcorelib_a_3335697613_3212880686_init();
    work_a_0459802145_0150257028_init();
    xilinxcorelib_a_2862418271_0543512595_init();
    xilinxcorelib_a_3473973889_3212880686_init();
    work_a_0585448164_0179438557_init();
    xilinxcorelib_a_0614131589_0543512595_init();
    xilinxcorelib_a_2122427770_3212880686_init();
    work_a_0899559079_0191916522_init();
    work_a_1053463661_3212880686_init();
    work_a_2766879185_3212880686_init();
    work_a_1211764056_3212880686_init();
    work_a_1404723187_2372691052_init();


    xsi_register_tops("work_a_1404723187_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_3564397177 = xsi_get_engine_memory("ieee_p_3564397177");

    return xsi_run_simulation(argc, argv);

}
