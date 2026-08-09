module Sign_Extend (
    input [31:0] In,
    input ImmSrc,
    output [31:0] Imm_Ext
);
    
    assign Imm_Ext = (ImmSrc == 1'b1) ? {{20{1'b1}}, In[31:25], In[11:7]} : //store word for immsrc 1
                    (In[31] == 1'b1) ? {{20{1'b1}}, In[31:20]} :    //lw for immsrc 0
                                        {{20{1'b0}}, In[31:20]};      
endmodule