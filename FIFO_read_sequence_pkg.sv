package FIFO_read_sequence_pkg;
	import uvm_pkg::*;
	import FIFO_sequence_item_pkg::*;
	`include "uvm_macros.svh"
	class FIFO_read_sequence extends uvm_sequence #(FIFO_sequence_item) ;
		`uvm_object_utils(FIFO_read_sequence)

		FIFO_sequence_item seq_item;

		function new(string name = "FIFO_read_sequence");
			super.new(name);
		endfunction

		task body;
			repeat(10) begin
				seq_item=FIFO_sequence_item::type_id::create("seq_item");
				start_item(seq_item);
				seq_item.rst_n=1;
				seq_item.wr_en=0;
				seq_item.rd_en=1;
				seq_item.data_in=0;
				finish_item(seq_item);
			end
		endtask : body
	endclass	
endpackage