/*
 * 
 *  dynamic linker command file
 *  generated: Sat Jan 22 18:23:41 2005

 *  kernel   : brickOS
 *  app start: 0xa494
 * 
 *  BrickOS for LEGO(R) Mindstorms(TM)
 *  Originally: legOS - the independent LEGO Mindstorms OS
 *              (c) 1999 by Markus L. Noga <markus@noga.de>    
 * 
 */

OUTPUT_FORMAT("symbolsrec")
OUTPUT_ARCH(h8300)
ENTRY("_main")

MEMORY {
  rom   : o = 0x0000, l = 0x8000
  kern  : o = 0x8000, l = 0x2494
  ram   : o = 0xa494, l = 0x5a68
  stack : o = 0xfefc, l = 0x0004
  eight : o = 0xff00, l = 0x0100
}

SECTIONS {

  .rom : {
    /* used rom functions */
    
    _rom_reset_vector = 0x0000;
        
    _reset        = 0x03ae ;
    lcd_show      = 0x1b62 ;
    lcd_hide      = 0x1e4a ;
    lcd_number    = 0x1ff2 ;
    lcd_clear     = 0x27ac ;
    power_init    = 0x2964 ;
    sound_system  = 0x299a ;
    power_off     = 0x2a62 ;
    sound_playing = 0x3ccc ;

    _rom_dummy_handler   = 0x046a ;
    _rom_ocia_handler    = 0x04cc ;
    _rom_ocia_return     = 0x04d4 ;
    
  } > rom

  .kernel :	{
    /* kernel symbols (relative to 0x8000) */
    _rom_reset_vector = 0xffff8000 ;
    _reset = 0xffff83ae ;
    rom_memcpy = 0xffff842a ;
    _rom_dummy_handler = 0xffff846a ;
    _rom_ocia_handler = 0xffff84cc ;
    _rom_ocia_return = 0xffff84d4 ;
    lcd_show = 0xffff9b62 ;
    lcd_hide = 0xffff9e4a ;
    lcd_number = 0xffff9ff2 ;
    lcd_clear = 0xffffa7ac ;
    power_init = 0xffffa964 ;
    sound_system = 0xffffa99a ;
    power_off = 0xffffaa62 ;
    sound_playing = 0xffffbccc ;
    _kmain = 0x0000 ;
    _mm_try_join = 0x00f6 ;
    _mm_defrag = 0x0138 ;
    _mm_update_first_free = 0x0178 ;
    _mm_init = 0x019e ;
    _malloc = 0x0206 ;
    _free = 0x02b4 ;
    _calloc = 0x02de ;
    _mm_reaper = 0x0326 ;
    _mm_free_mem = 0x0358 ;
    _clock_handler = 0x03a0 ;
    _subsystem_handler = 0x03c4 ;
    _task_switch_handler = 0x0412 ;
    _systime_tm_return = 0x042c ;
    _systime_init = 0x0440 ;
    _systime_shutdown = 0x04b8 ;
    _systime_set_switcher = 0x04ca ;
    _systime_set_timeslice = 0x04d0 ;
    _get_system_up_time = 0x04ee ;
    _tm_switcher = 0x0504 ;
    _tm_scheduler = 0x0520 ;
    _yield = 0x06d2 ;
    _tm_init = 0x06f0 ;
    _tm_start = 0x0738 ;
    _execi = 0x0748 ;
    _exit = 0x0914 ;
    _wait_event = 0x0936 ;
    _msleep = 0x09e0 ;
    _sleep = 0x0a18 ;
    _shutdown_task = 0x0a3c ;
    _shutdown_tasks = 0x0a48 ;
    _kill = 0x0a9a ;
    _killall = 0x0ad2 ;
    _sem_event_wait = 0x0b5e ;
    _sem_wait = 0x0b74 ;
    _sem_trywait = 0x0ba4 ;
    _sem_post = 0x0bbc ;
    _delay = 0x0bcc ;
    _cputc_native = 0x0be6 ;
    _cputc_native_0 = 0x0c14 ;
    _cputc_native_1 = 0x0c48 ;
    _cputc_native_2 = 0x0c7e ;
    _cputc_native_3 = 0x0cb8 ;
    _cputc_native_4 = 0x0cf4 ;
    _cputc_native_5 = 0x0d30 ;
    _cputw = 0x0d3c ;
    _cputs = 0x0d80 ;
    _cls = 0x0dce ;
    _lcd_number = 0x0dd6 ;
    _lcd_refresh_next_byte = 0x0e74 ;
    _lcd_refresh_next_byte_core = 0x0e88 ;
    _lcd_refresh = 0x0ece ;
    _lcd_power_on = 0x0eee ;
    _lcd_power_off = 0x0f00 ;
    _lcd_init = 0x0f1c ;
    _rx_handler = 0x0f62 ;
    _rx_core = 0x0f76 ;
    _rxerror_handler = 0x0fe6 ;
    _rxerror_core = 0x0ffa ;
    _txend_handler = 0x103c ;
    _txend_core = 0x1050 ;
    _tx_handler = 0x105e ;
    _tx_core = 0x1072 ;
    _lnp_logical_shutdown = 0x1098 ;
    _lnp_logical_init = 0x10b8 ;
    _lnp_logical_write = 0x1162 ;
    _lnp_integrity_write = 0x122c ;
    _lnp_addressing_write = 0x1292 ;
    _lnp_receive_packet = 0x1322 ;
    _lnp_integrity_byte = 0x139a ;
    _lnp_integrity_reset = 0x1434 ;
    _lnp_integrity_reset_core = 0x1448 ;
    _lnp_timeout_reset = 0x1468 ;
    _lnp_timeout_reset_core = 0x147c ;
    _lnp_init = 0x1486 ;
    _lnp_integrity_active = 0x14ae ;
    _lnp_timeout_set = 0x14ba ;
    _program_valid = 0x14c4 ;
    _program_stop = 0x18be ;
    _key_handler = 0x193e ;
    _program_init = 0x1adc ;
    _program_shutdown = 0x1b2c ;
    _get_battery_mv = 0x1b34 ;
    _shutoff_restart = 0x1b5e ;
    _shutoff_init = 0x1b6e ;
    _autoshutoff_check = 0x1b7a ;
    _autoshutoff_check_core = 0x1b8e ;
    _dkey_handler = 0x1bbe ;
    _dkey_pressed = 0x1bfc ;
    _dkey_released = 0x1c1e ;
    _getchar = 0x1c3e ;
    _dm_init = 0x1c66 ;
    _dm_shutdown = 0x1c6a ;
    _ds_rotation_set = 0x1c96 ;
    _ds_rotation_handler = 0x1cea ;
    _ds_init = 0x1dd6 ;
    _ds_shutdown = 0x1e0c ;
    _dsound_handler = 0x1e24 ;
    _dsound_core = 0x1e38 ;
    _dsound_init = 0x1f2c ;
    _dsound_shutdown = 0x1f44 ;
    _dsound_stop = 0x1f48 ;
    _dsound_finished = 0x1f68 ;
    _locked_increment = 0x1f82 ;
    _locked_decrement = 0x1f92 ;
    _memcpy = 0x1fa2 ;
    _memset = 0x1fb2 ;
    ___mulhi3 = 0x1fc0 ;
    ___udivhi3 = 0x1fd0 ;
    ___mulsi3 = 0x1fe2 ;
    ___divsi3 = 0x1ffe ;
    _hex_display_codes = 0x203c ;
    _ascii_display_codes = 0x204c ;
    _min_length = 0x20de ;
    _dm_a_pattern = 0x20fa ;
    _dm_b_pattern = 0x20fe ;
    _dm_c_pattern = 0x2102 ;
    ___ctors = 0x21e4 ;
    ___ctors_end = 0x21e4 ;
    ___dtors = 0x21e4 ;
    ___dtors_end = 0x21e4 ;
    _firmware_string = 0x21e4 ;
    _etext = 0x21e4 ;
    _lcd_refresh_period = 0x21e6 ;
    _lnp_hostaddr = 0x21e8 ;
    _lnp_timeout = 0x21ea ;
    _battery_refresh_counter = 0x21ec ;
    _battery_refresh_period = 0x21ee ;
    _auto_shutoff_counter = 0x21f0 ;
    _auto_shutoff_period = 0x21f2 ;
    _auto_shutoff_secs = 0x21f4 ;
    _auto_shutoff_elapsed = 0x21f6 ;
    _idle_powerdown = 0x21f8 ;
    _dsound_system_sounds = 0x21fa ;
    __edata = 0x21fc ;
    _bss_start = 0x2200 ;
    _mm_first_free = 0x23ea ;
    _tm_timeslice = 0x23ec ;
    _tm_current_slice = 0x23ed ;
    _tm_switcher_vector = 0x23ee ;
    _sys_time = 0x23f0 ;
    _ctid = 0x2400 ;
    _td_single = 0x2410 ;
    _nb_tasks = 0x2424 ;
    _priority_head = 0x2426 ;
    _nb_system_tasks = 0x2428 ;
    _lcd_byte_counter = 0x242a ;
    _lcd_refresh_counter = 0x242b ;
    _tx_state = 0x242c ;
    _lnp_integrity_handler = 0x2430 ;
    _lnp_timeout_counter = 0x2432 ;
    _lnp_addressing_handler = 0x2440 ;
    _lnp_integrity_state = 0x2460 ;
    _packet_len = 0x2462 ;
    _cprog = 0x2464 ;
    _packet_src = 0x2466 ;
    _dkey_timer = 0x2468 ;
    _dkey = 0x2469 ;
    _dkey_multi = 0x246a ;
    _dm_a = 0x246c ;
    _dm_b = 0x2470 ;
    _dm_c = 0x2474 ;
    _ds_rotation = 0x2478 ;
    _ds_channel = 0x2479 ;
    _ds_rotations = 0x247c ;
    _ds_activation = 0x2482 ;
    _dsound_next_note = 0x2484 ;
    _dsound_internote_ms = 0x2486 ;
    _dsound_16th_ms = 0x2488 ;
    _dsound_next_time = 0x248c ;
    _kernel_critsec_count = 0x2490 ;
    _end = 0x2492 ;
    _mm_start = 0x2492 ;
    _display_memory = 0x6f43 ;
    _dm_handler = 0x7002 ;
    ___etext_hi = 0x704a ;
    _rom_port1_ddr = 0x7d80 ;
    _rom_port2_ddr = 0x7d81 ;
    _rom_port3_ddr = 0x7d82 ;
    _rom_port4_ddr = 0x7d83 ;
    _rom_port5_ddr = 0x7d84 ;
    _rom_port6_ddr = 0x7d85 ;
    _rom_port7_pin = 0x7d86 ;
    _reset_vector = 0x7d90 ;
    _nmi_vector = 0x7d92 ;
    _irq0_vector = 0x7d94 ;
    _irq1_vector = 0x7d96 ;
    _irq2_vector = 0x7d98 ;
    _icia_vector = 0x7d9a ;
    _icib_vector = 0x7d9c ;
    _icic_vector = 0x7d9e ;
    _icid_vector = 0x7da0 ;
    _ocia_vector = 0x7da2 ;
    _ocib_vector = 0x7da4 ;
    _fovi_vector = 0x7da6 ;
    _cmi0a_vector = 0x7da8 ;
    _cmi0b_vector = 0x7daa ;
    _ovi0_vector = 0x7dac ;
    _cmi1a_vector = 0x7dae ;
    _cmi1b_vector = 0x7db0 ;
    _ovi1_vector = 0x7db2 ;
    _eri_vector = 0x7db4 ;
    _rxi_vector = 0x7db6 ;
    _txi_vector = 0x7db8 ;
    _tei_vector = 0x7dba ;
    _ad_vector = 0x7dbc ;
    _wovf_vector = 0x7dbe ;
    _stack = 0x7e00 ;
    _motor_controller = 0x7f80 ;
    _T_IER = 0x7f90 ;
    _T_CSR = 0x7f91 ;
    _T_CNT = 0x7f92 ;
    _T_OCRA = 0x7f94 ;
    _T_OCRB = 0x7f94 ;
    _T_CR = 0x7f96 ;
    _T_OCR = 0x7f97 ;
    _T_ICRA = 0x7f98 ;
    _T_ICRB = 0x7f9a ;
    _T_ICRC = 0x7f9c ;
    _T_ICRD = 0x7f9e ;
    _WDT_CSR = 0x7fa8 ;
    _WDT_CNT = 0x7fa9 ;
    _PORT1_PCR = 0x7fac ;
    _PORT2_PCR = 0x7fad ;
    _PORT3_PCR = 0x7fae ;
    _PORT1_DDR = 0x7fb0 ;
    _PORT2_DDR = 0x7fb1 ;
    _PORT1 = 0x7fb2 ;
    _PORT2 = 0x7fb3 ;
    _PORT3_DDR = 0x7fb4 ;
    _PORT4_DDR = 0x7fb5 ;
    _PORT3 = 0x7fb6 ;
    _PORT4 = 0x7fb7 ;
    _PORT5_DDR = 0x7fb8 ;
    _PORT6_DDR = 0x7fb9 ;
    _PORT5 = 0x7fba ;
    _PORT6 = 0x7fbb ;
    _PORT7 = 0x7fbe ;
    _STCR = 0x7fc3 ;
    _SYSCR = 0x7fc4 ;
    _T0_CR = 0x7fc8 ;
    _T0_CSR = 0x7fc9 ;
    _T0_CORA = 0x7fca ;
    _T0_CORB = 0x7fcb ;
    _T0_CNT = 0x7fcc ;
    _T1_CR = 0x7fd0 ;
    _T1_CSR = 0x7fd1 ;
    _T1_CORA = 0x7fd2 ;
    _T1_CORB = 0x7fd3 ;
    _T1_CNT = 0x7fd4 ;
    _S_MR = 0x7fd8 ;
    _S_BRR = 0x7fd9 ;
    _S_CR = 0x7fda ;
    _S_TDR = 0x7fdb ;
    _S_SR = 0x7fdc ;
    _S_RDR = 0x7fdd ;
    _AD_A = 0x7fe0 ;
    _AD_A_H = 0x7fe0 ;
    _AD_A_L = 0x7fe1 ;
    _AD_B = 0x7fe2 ;
    _AD_B_H = 0x7fe2 ;
    _AD_B_L = 0x7fe3 ;
    _AD_C = 0x7fe4 ;
    _AD_C_H = 0x7fe4 ;
    _AD_C_L = 0x7fe5 ;
    _AD_D = 0x7fe6 ;
    _AD_D_H = 0x7fe6 ;
    _AD_D_L = 0x7fe7 ;
    _AD_CSR = 0x7fe8 ;
    _AD_CR = 0x7fe9 ;
    /* end of kernel symbols */
  }  > kern
      
  .text BLOCK(2) :	{
    ___text = . ;
    *(.text) 	      /* must start with text for clean entry */			
    *(.rodata)
    *(.strings)
    *(.vectors)       /* vectors region (dummy) */
    *(.persist)

    ___text_end = . ;
  }  > ram

  .tors BLOCK(2) : {
    ___ctors = . ;
    *(.ctors)
    ___ctors_end = . ;
    ___dtors = . ;
    *(.dtors)
    ___dtors_end = . ;
  }  > ram

  .data BLOCK(2) : {
    ___data = . ;
    *(.data)
    *(.tiny)
    ___data_end = . ;
  }  > ram

  .bss BLOCK(2) : {
    ___bss = . ;
    *(.bss)
    *(COMMON)
    ___bss_end = ALIGN(2) ;
  }  >ram

  .stack : {
    _stack = . ; 
    *(.stack)
  }  > stack

  .eight 0xff00: {
    *(.eight)

    /* on-chip module registers (relative to 0xff00) */

    _T_IER = 0x90 ;
    _T_CSR = 0x91 ;
    _T_CNT = 0x92 ;
    _T_OCRA = 0x94 ;
    _T_OCRB = 0x94 ;
    _T_CR = 0x96 ;
    _T_OCR = 0x97 ;
    _T_ICRA = 0x98 ;
    _T_ICRB = 0x9a ;
    _T_ICRC = 0x9c ;
    _T_ICRD = 0x9e ;
    _WDT_CSR = 0xa8 ;
    _WDT_CNT = 0xa9 ;
    _PORT1_PCR = 0xac ;
    _PORT2_PCR = 0xad ;
    _PORT3_PCR = 0xae ;
    _PORT1_DDR = 0xb0 ;
    _PORT2_DDR = 0xb1 ;
    _PORT1 = 0xb2 ;
    _PORT2 = 0xb3 ;
    _PORT3_DDR = 0xb4 ;
    _PORT4_DDR = 0xb5 ;
    _PORT3 = 0xb6 ;
    _PORT4 = 0xb7 ;
    _PORT5_DDR = 0xb8 ;
    _PORT6_DDR = 0xb9 ;
    _PORT5 = 0xba ;
    _PORT6 = 0xbb ;
    _PORT7 = 0xbe ;
    _STCR = 0xc3 ;
    _SYSCR = 0xc4 ;
    _T0_CR = 0xc8 ;
    _T0_CSR = 0xc9 ;
    _T0_CORA = 0xca ;
    _T0_CORB = 0xcb ;
    _T0_CNT = 0xcc ;
    _T1_CR = 0xd0 ;
    _T1_CSR = 0xd1 ;
    _T1_CORA = 0xd2 ;
    _T1_CORB = 0xd3 ;
    _T1_CNT = 0xd4 ;
    _S_MR = 0xd8 ;
    _S_BRR = 0xd9 ;
    _S_CR = 0xda ;
    _S_TDR = 0xdb ;
    _S_SR = 0xdc ;
    _S_RDR = 0xdd ;
    _AD_A = 0xe0 ;
    _AD_A_H = 0xe0 ;
    _AD_A_L = 0xe1 ;
    _AD_B = 0xe2 ;
    _AD_B_H = 0xe2 ;
    _AD_B_L = 0xe3 ;
    _AD_C = 0xe4 ;
    _AD_C_H = 0xe4 ;
    _AD_C_L = 0xe5 ;
    _AD_D = 0xe6 ;
    _AD_D_H = 0xe6 ;
    _AD_D_L = 0xe7 ;
    _AD_CSR = 0xe8 ;
    _AD_CR = 0xe9 ;
    
    /* end of on-chip module registers */
    
  }  > eight

  .stab 0 (NOLOAD) : {
    [ .stab ]
  }

  .stabstr 0 (NOLOAD) : {
    [ .stabstr ]
  }

} /* SECTIONS */
