//Javier Abadía / jabadiagm@gmail.com
//Structure based on Multicomputer by Grant Searle:
//           http://searle.x10host.com/Multicomp/index.html

module top(

	   //74lvc245 buffer signals
	    //address bus
		input [7:0] ex_bus_addr,

		//data bus
		inout [7:0] ex_bus_data,
		
		//control bus
		input ex_bus_iorq_n,
		input ex_bus_rd_n,
		input ex_bus_wr_n,
		input ex_bus_reset_n,
		input ex_bus_clk_3m6,

		//interrupt
		//ex_int_n         : out std_logic;

		//fpga signals
		input ex_reset,
        input ex_clk_27m,
        input ex_btn0,
		
        //hdmi out
//        output [2:0] data_p,
//        output [2:0] data_n,
//        output clk_p,
//        output clk_n,

        //lcd out
        output          LCD_CLK,
        output			LCD_HSYNC,
        output			LCD_VSYNC,
        output			LCD_DEN,
        output			LCD_BL,
        output	[4:0]	LCD_R,
        output	[5:0]	LCD_G,
        output	[4:0]	LCD_B,

        // Magic ports for SDRAM to be inferred
        output O_sdram_clk,
        output O_sdram_cke,
        output O_sdram_cs_n, // chip select
        output O_sdram_cas_n, // columns address select
        output O_sdram_ras_n, // row address select
        output O_sdram_wen_n, // write enable
        inout [31:0] IO_sdram_dq, // 32 bit bidirectional data bus
        output [10:0] O_sdram_addr, // 11 bit multiplexed address bus
        output [1:0] O_sdram_ba, // two banks
        output [3:0] O_sdram_dqm // 32/4
        

	);


	wire [7:0] bus_addr;
	wire [7:0] bus_data;
		
	wire bus_iorq_n;
	wire bus_rd_n;
	wire bus_wr_n;
	wire bus_reset_n;
	wire bus_clk_3m6;

	wire mreq_rd_n;

	wire iorq_wr_n;
	wire iorq_rd_n;
	
    reg clk_1m8;

    wire reset;
    wire reset_n;
    reg bus_data_reverse;
    reg [4:0] bus_data_counter;
    reg [1:0] bus_data_state;

	//YM2149 PSG signals
	wire psgBc1; //psg chip select & mode 1/2
	wire psgBdir; //psg chip select & mode 2/2
	wire [7:0] psgDataOut; //psg output
	wire [7:0] psgSound1; //psg output sound channel 1
	wire [7:0] psgSound2 = 8'b10000000; //psg output sound channel 2
	wire [7:0] psgSound3; //psg output sound channel 3
	wire [7:0] psgPA; //psg port a
	wire [7:0] psgPB = 8'hff; //psg port b
	wire [7:0] psgDebug;

    //V9958 signals
	wire v9958_csw_n; //VDP write request
	wire v9958_csr_n; //VDP read request	
    wire [5:0]	VideoR;
    wire [5:0]	VideoG;
    wire [5:0]	VideoB;
    wire VideoHS_n;
    wire VideoVS_n;
    wire blank_o;

    //opll signals
    wire opll_req_n; 

    //mixer signals
    reg [23:0] fm_wav;
    reg [16:0] fm_mix;
    wire [23:0] fm_wav_filter;
	reg [15:0] audio_sample;
	reg [15:0] audio_sample1;
	reg [15:0] audio_sample2;


// ____________________________________________________________________________________
// clock signals


//generated clocks

always @ (posedge bus_clk_3m6) begin
    clk_1m8 <= ~clk_1m8;
end



// ____________________________________________________________________________________
// MEMORY READ/WRITE LOGIC GOES HERE
assign iorq_wr_n = bus_wr_n | bus_iorq_n;
assign iorq_rd_n = bus_rd_n | bus_iorq_n;




assign reset = ~bus_reset_n;
assign reset_n = bus_reset_n;


assign v9958_csw_n = ( bus_addr [7:2] == 6'b100110 && iorq_wr_n == 0 )? 0 : 1; // I/O:98-9Bh   / VDP (V9938/V9958)
assign v9958_csr_n = ( bus_addr [7:2] == 6'b100110 && iorq_rd_n == 0 )? 0 : 1; // I/O:98-9Bh   / VDP (V9938/V9958)
wire LCD_HSYNC2;
wire LCD_VSYNC2;
wire LCD_DEN2;
assign LCD_CLK = ex_clk_27m;
assign LCD_BL = 1;
//assign LCD_HSYNC = 0; //~VideoHS_n;
//assign LCD_VSYNC = 0; //~VideoVS_n;
assign LCD_DEN = ~blank_o;
assign LCD_R = ( LCD_DEN == 1) ? VideoR[5:1] : 0;
assign LCD_G = ( LCD_DEN == 1) ? { VideoG } : 0;
assign LCD_B = ( LCD_DEN == 1) ? VideoB[5:1]  : 0;
wire clk_108m;

v9958_top vdp4 (
    .clk (ex_clk_27m),
    .s1 (ex_reset),
    .clk_50 (0),
    .clk_125 (0),
    .clk_108m(clk_108m),

    .reset_n (bus_reset_n),
    .mode    (bus_addr[1:0]),
    .csw_n   (v9958_csw_n),
    .csr_n   (v9958_csr_n),

    .int_n   ( ),
    .gromclk ( ),
    .cpuclk  ( ),
    .cdi     ( ),
    .cdo     (bus_data),

    //audio_sample   (psgSound1 & "0000", 
    .audio_sample   (audio_sample), 

    .adc_clk  ( ),
    .adc_cs   ( ),
    .adc_mosi ( ),
    .adc_miso (0),

    .maxspr_n    (1),
    .scanlin_n   (1),
    .gromclk_ena_n   (1),
    .cpuclk_ena_n    (1),

    .O_sdram_clk (O_sdram_clk),
    .O_sdram_cke (O_sdram_cke),
    .O_sdram_cs_n (O_sdram_cs_n),
    .O_sdram_cas_n (O_sdram_cas_n),
    .O_sdram_ras_n (O_sdram_ras_n),
    .O_sdram_wen_n (O_sdram_wen_n),
    .IO_sdram_dq (IO_sdram_dq),
    .O_sdram_addr (O_sdram_addr),
    .O_sdram_ba (O_sdram_ba),
    .O_sdram_dqm (O_sdram_dqm),


    .tmds_clk_p    (clk_p),
    .tmds_clk_n    (clk_n),
    .tmds_data_p   (data_p),
    .tmds_data_n   (data_n),

    .VideoR (VideoR),
    .VideoG (VideoG),
    .VideoB (VideoB),
    .VideoHS_n (VideoHS_n),
    .VideoVS_n (VideoVS_n),
    .blank_o (blank_o)

    );

//VGAMod	VGAMod_inst
//(
//.nRST		(  !Reset_Button),

//.PixelClk	(	ex_clk_27m		),
//.LCD_DE		(	), //LCD_DEN	 	),
//.LCD_HSYNC	(	), //LCD_HSYNC 	),
//.LCD_VSYNC	(	), //LCD_VSYNC 	),

//.LCD_B		(	LCD_B		),
//.LCD_G		(	LCD_G		),
//.LCD_R		(	LCD_R		)
//);

//wire [9:0] cx;
//wire [9:0] cy;
//wire f18_blank;
//assign LCD_DE = ~f18_blank;
//assign LCD_R = cx;
//assign LCD_G = cy;
//assign LCD_B = 0;
//f18a_vga_cont_640_60 vga2 (
//      .vga_clk  (ex_clk_27m),
//      .rst_n    (reset_n),
//      .hsync    (LCD_HSYNC),
//      .vsync    (LCD_VSYNC),
//      .raster_x (cx),
//      .raster_y (cy),
//      .y_tick   ( ),
//      .y_max    ( ),
//      .blank    (f18_blank)
//   );

    //f18a signals
//	wire f18a_csw_n;
//	wire f18a_csr_n;
//    wire [3:0] f18a_red;
//    wire [3:0] f18a_green;
//    wire [3:0] f18a_blue;
//    wire f18a_hsync;
//    wire f18a_vsync;
//    wire f18a_blank;

//F18A VDP and signals
//assign f18a_csw_n = ( bus_addr [7:3] == 6'b10011 && iorq_wr_n == 0 )? 0 : 1; // I/O:98-9Bh   / VDP (V9938/V9958)
//assign f18a_csr_n = ( bus_addr [7:3] == 6'b10011 && iorq_rd_n == 0 )? 0 : 1; // I/O:98-9Bh   / VDP (V9938/V9958)


// f18a_core vdp2 (
//      .clk_100m0_i    (ex_clk_27m),
//      .clk_25m0_i     (ex_clk_27m),
//      .reset_n_i      (reset_n),
//      .mode_i         (bus_addr),
//      .csw_n_i        (f18a_csw_n),
//      .csr_n_i        (f18a_csr_n),
//      .int_n_o        ( ),
//      .cd_i           (bus_data),
//      .cd_o           ( ),
//      .blank_o        (f18a_blank),
//      .hsync_o        (f18a_hsync),
//      .vsync_o        (f18a_vsync),
//      .red_o          (f18a_red),
//      .grn_o          (f18a_green),
//      .blu_o          (f18a_blue),
//      .sprite_max_i   (1),
//      .scanlines_i    (0),
//      .spi_clk_o      ( ),
//      .spi_cs_o       ( ),
//      .spi_mosi_o     ( ),
//      .spi_miso_i     (1)
//   );


//assign LCD_R = f18a_red;
//assign LCD_G = f18a_green;
//assign LCD_B = f18a_blue;
//assign LCD_DEN = ~f18a_blank;
//assign LCD_VSYNC = ~f18a_vsync;
//assign LCD_HSYNC = ~f18a_hsync;
//assign LCD_CLK = ex_clk_27m;


//YM219 PSG and signals
assign psgBdir = ( bus_addr[7:3]== 5'b10100 && iorq_wr_n == 0 && bus_addr[1]== 0 ) ?  1 : 0; // I/O:A0-A2h / PSG(AY-3-8910) bdir = 1 when writing to &HA0-&Ha1
assign psgBc1 = ( bus_addr[7:3]== 5'b10100 && ((iorq_rd_n==0 && bus_addr[1]== 1) || (bus_addr[1]==0 && iorq_wr_n==0 && bus_addr[0]==0))) ? 1 : 0; // I/O:A0-A2h / PSG(AY-3-8910) bc1 = 1 when writing A0 or reading A2

assign psgPA =8'h00;

YM2149 psg1 (
        // data bus
        .I_DA        (bus_data),
        .O_DA        (psgDataOut),
        .O_DA_OE_L   ( ),
        // control
        .I_A9_L      (0),
        .I_A8        (1),
        .I_BDIR      (psgBdir),
        .I_BC2       (1),
        .I_BC1       (psgBc1),
        .I_SEL_L     (1),
        
        .O_AUDIO     (psgSound1),
        // port a
        .I_IOA       (psgPA),
        .O_IOA       ( ),
        .O_IOA_OE_L  ( ),
        // port b
        .I_IOB       (psgPB),
        .O_IOB       ( ),
        .O_IOB_OE_L  ( ),
        
        .ENA         (1), // clock enable for higher speed operation
        .RESET_L     (bus_reset_n),
        .CLK         (clk_1m8),
        .clkHigh     (ex_clk_27m),
        .debug       (psgDebug)
    );


//opll and signals
assign opll_req_n  =  ( bus_iorq_n == 0 && bus_addr[7:1] == 7'b0111110  && bus_wr_n == 0 ) ? 0 : 1;    // I/O:7C-7Dh   / OPLL (YM2413)
wire [13:0] opll_mixout;
opll opll1 (
        .xin         (bus_clk_3m6),
        .xout        ( ),
        .xena        (1),
        .d           (bus_data),
        .a           (bus_addr[0]),
        .cs_n        (opll_req_n),
        .we_n        (0),
        .ic_n        (reset_n),
        .mixout(opll_mixout)
    );


//fm_filter # (
//        .DATA_WIDTH (24)
//    )
//    filtro_fm (
//        .clk_3m6 (ex_bus_clk_3m6),
//        .clk_27m (ex_clk_27m),
//        .reset (reset),
//        .data_in (fm_wav),
//        .data_out (fm_wav_filter)
//    );


//mixer
reg [15:0] opll_mix;
reg [15:0] psg_mix;
reg [15:0] audio_sample;

always @ (posedge ex_clk_27m) begin
    opll_mix <=  { opll_mixout[13:0], 2'b0 } + 16'b1000000000000000;
    psg_mix <=   { 3'b0, psgSound1[7:0], 5'b0 };

    audio_sample <= opll_mix + psg_mix;
end

wire [15:0] lpf1_audio_w;
wire [15:0] lpf2_audio_w;

interpo #(
    .MSBI(15)    
)(
    .clk21m(ex_clk_27m),
    .reset(0),
    .clkena(1),
    .idata(audio_sample[15:0]),
    .odata(lpf1_audio_w)
);

lpf1 #(
	.MSBI(15)
) (
    .clk21m (ex_clk_27m),
    .reset(0),
    .clkena(1),
    .idata(lpf1_audio_w),
    .odata (lpf2_audio_w)
);


wire [15:0] dacin_w;
lpf2 #(
	.MSBI(15)
) (
    .clk21m (ex_clk_27m),
    .reset(0),
    .clkena(1),
    .idata(lpf2_audio_w),
    .odata (dacin_w)
);

wire audio_w;
esepwm#(
    .MSBI(15)
)(
    .clk(ex_clk_27m),
    .reset(0),
    .DACin(dacin_w),
    .DACout(audio_w)
);


assign LCD_HSYNC = audio_w;
assign LCD_VSYNC = 0;

denoise_low denoise2 (
		.data_in (ex_bus_iorq_n),
		.clock (ex_clk_27m),
		.data_out (bus_iorq_n)
	);

denoise_low denoise3 (
		.data_in (ex_bus_rd_n),
		.clock (ex_clk_27m),
		.data_out (bus_rd_n)
	);

denoise_low denoise4 (
		.data_in (ex_bus_wr_n),
		.clock (ex_clk_27m),
		.data_out (bus_wr_n)
	);

denoise_low denoise5 (
		.data_in (ex_bus_reset_n),
		.clock (ex_clk_27m),
		.data_out (bus_reset_n)
	);

denoise denoise6 (
		.data_in (ex_bus_clk_3m6),
		.clock (ex_clk_27m),
		.data_out (bus_clk_3m6)
	);

denoise_8 denoise8 (
		.data8_in    (ex_bus_addr[7:0]),
		.clock	    ( ex_clk_27m),
		.data8_out	( bus_addr[7:0] )
    );

denoise_8 denoise10 (
		.data8_in    (ex_bus_data),
		.clock		( ex_clk_27m ),
		.data8_out	( bus_data)
    );



endmodule
