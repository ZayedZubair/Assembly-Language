[org 0x100]
mov dx,10

outerloop:
    mov bx, 0
    mov byte [swap], 0      

innerloop:

    mov ax, [data + bx]
    cmp ax, [data + bx + 2]
    jna donothing  
          
    ; Swap values
    mov cx, [data + bx + 2]
    mov [data + bx + 2], ax
    mov [data + bx], cx
    mov byte [swap], 1   
    
donothing:

    add bx, 2
   
                   
    cmp bx, dx
    jb innerloop            
    cmp byte [swap], 0
    je exit

    sub dx, 2                 
    jz outerloop 
           
exit:
    mov ax, 4c00h
    int 0x21                


data:   dw  1,2,3,6,5,4
swap:   db  0
