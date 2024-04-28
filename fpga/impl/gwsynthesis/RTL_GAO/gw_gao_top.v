module gw_gao(
    \nose4[5] ,
    \nose4[4] ,
    \nose4[3] ,
    \nose4[2] ,
    \nose4[1] ,
    \nose4[0] ,
    \LCD_G[5] ,
    \LCD_G[4] ,
    \LCD_G[3] ,
    \LCD_G[2] ,
    \LCD_G[1] ,
    \LCD_G[0] ,
    \VideoG[5] ,
    \VideoG[4] ,
    \VideoG[3] ,
    \VideoG[2] ,
    \VideoG[1] ,
    \VideoG[0] ,
    LCD_VSYNC,
    LCD_DEN,
    ex_bus_clk_3m6,
    \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[10] ,
    \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[9] ,
    \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[8] ,
    \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[7] ,
    \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[6] ,
    \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[5] ,
    \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[4] ,
    \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[3] ,
    \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[2] ,
    \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[1] ,
    \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[0] ,
    \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[10] ,
    \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[9] ,
    \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[8] ,
    \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[7] ,
    \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[6] ,
    \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[5] ,
    \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[4] ,
    \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[3] ,
    \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[2] ,
    \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[1] ,
    \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[0] ,
    clk_1m8,
    tms_pad_i,
    tck_pad_i,
    tdi_pad_i,
    tdo_pad_o
);

input \nose4[5] ;
input \nose4[4] ;
input \nose4[3] ;
input \nose4[2] ;
input \nose4[1] ;
input \nose4[0] ;
input \LCD_G[5] ;
input \LCD_G[4] ;
input \LCD_G[3] ;
input \LCD_G[2] ;
input \LCD_G[1] ;
input \LCD_G[0] ;
input \VideoG[5] ;
input \VideoG[4] ;
input \VideoG[3] ;
input \VideoG[2] ;
input \VideoG[1] ;
input \VideoG[0] ;
input LCD_VSYNC;
input LCD_DEN;
input ex_bus_clk_3m6;
input \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[10] ;
input \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[9] ;
input \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[8] ;
input \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[7] ;
input \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[6] ;
input \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[5] ;
input \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[4] ;
input \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[3] ;
input \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[2] ;
input \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[1] ;
input \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[0] ;
input \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[10] ;
input \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[9] ;
input \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[8] ;
input \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[7] ;
input \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[6] ;
input \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[5] ;
input \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[4] ;
input \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[3] ;
input \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[2] ;
input \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[1] ;
input \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[0] ;
input clk_1m8;
input tms_pad_i;
input tck_pad_i;
input tdi_pad_i;
output tdo_pad_o;

wire \nose4[5] ;
wire \nose4[4] ;
wire \nose4[3] ;
wire \nose4[2] ;
wire \nose4[1] ;
wire \nose4[0] ;
wire \LCD_G[5] ;
wire \LCD_G[4] ;
wire \LCD_G[3] ;
wire \LCD_G[2] ;
wire \LCD_G[1] ;
wire \LCD_G[0] ;
wire \VideoG[5] ;
wire \VideoG[4] ;
wire \VideoG[3] ;
wire \VideoG[2] ;
wire \VideoG[1] ;
wire \VideoG[0] ;
wire LCD_VSYNC;
wire LCD_DEN;
wire ex_bus_clk_3m6;
wire \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[10] ;
wire \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[9] ;
wire \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[8] ;
wire \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[7] ;
wire \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[6] ;
wire \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[5] ;
wire \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[4] ;
wire \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[3] ;
wire \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[2] ;
wire \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[1] ;
wire \vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[0] ;
wire \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[10] ;
wire \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[9] ;
wire \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[8] ;
wire \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[7] ;
wire \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[6] ;
wire \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[5] ;
wire \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[4] ;
wire \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[3] ;
wire \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[2] ;
wire \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[1] ;
wire \vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[0] ;
wire clk_1m8;
wire tms_pad_i;
wire tck_pad_i;
wire tdi_pad_i;
wire tdo_pad_o;
wire tms_i_c;
wire tck_i_c;
wire tdi_i_c;
wire tdo_o_c;
wire [9:0] control0;
wire gao_jtag_tck;
wire gao_jtag_reset;
wire run_test_idle_er1;
wire run_test_idle_er2;
wire shift_dr_capture_dr;
wire update_dr;
wire pause_dr;
wire enable_er1;
wire enable_er2;
wire gao_jtag_tdi;
wire tdo_er1;

IBUF tms_ibuf (
    .I(tms_pad_i),
    .O(tms_i_c)
);

IBUF tck_ibuf (
    .I(tck_pad_i),
    .O(tck_i_c)
);

IBUF tdi_ibuf (
    .I(tdi_pad_i),
    .O(tdi_i_c)
);

OBUF tdo_obuf (
    .I(tdo_o_c),
    .O(tdo_pad_o)
);

GW_JTAG  u_gw_jtag(
    .tms_pad_i(tms_i_c),
    .tck_pad_i(tck_i_c),
    .tdi_pad_i(tdi_i_c),
    .tdo_pad_o(tdo_o_c),
    .tck_o(gao_jtag_tck),
    .test_logic_reset_o(gao_jtag_reset),
    .run_test_idle_er1_o(run_test_idle_er1),
    .run_test_idle_er2_o(run_test_idle_er2),
    .shift_dr_capture_dr_o(shift_dr_capture_dr),
    .update_dr_o(update_dr),
    .pause_dr_o(pause_dr),
    .enable_er1_o(enable_er1),
    .enable_er2_o(enable_er2),
    .tdi_o(gao_jtag_tdi),
    .tdo_er1_i(tdo_er1),
    .tdo_er2_i(1'b0)
);

gw_con_top  u_icon_top(
    .tck_i(gao_jtag_tck),
    .tdi_i(gao_jtag_tdi),
    .tdo_o(tdo_er1),
    .rst_i(gao_jtag_reset),
    .control0(control0[9:0]),
    .enable_i(enable_er1),
    .shift_dr_capture_dr_i(shift_dr_capture_dr),
    .update_dr_i(update_dr)
);

ao_top_0  u_la0_top(
    .control(control0[9:0]),
    .trig0_i(LCD_VSYNC),
    .trig1_i(LCD_DEN),
    .trig2_i(ex_bus_clk_3m6),
    .trig3_i({\vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[10] ,\vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[9] ,\vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[8] ,\vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[7] ,\vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[6] ,\vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[5] ,\vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[4] ,\vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[3] ,\vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[2] ,\vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[1] ,\vdp4/u_v9958/U_VDP_VGA/VCOUNTERIN[0] }),
    .trig4_i({\vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[10] ,\vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[9] ,\vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[8] ,\vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[7] ,\vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[6] ,\vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[5] ,\vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[4] ,\vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[3] ,\vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[2] ,\vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[1] ,\vdp4/u_v9958/U_VDP_VGA/HCOUNTERIN[0] }),
    .data_i({\nose4[5] ,\nose4[4] ,\nose4[3] ,\nose4[2] ,\nose4[1] ,\nose4[0] ,\LCD_G[5] ,\LCD_G[4] ,\LCD_G[3] ,\LCD_G[2] ,\LCD_G[1] ,\LCD_G[0] ,\VideoG[5] ,\VideoG[4] ,\VideoG[3] ,\VideoG[2] ,\VideoG[1] ,\VideoG[0] }),
    .clk_i(clk_1m8)
);

endmodule
