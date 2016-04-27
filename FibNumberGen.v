module fibNumberGen (startingValue, valid, ready, fibNum);
    input [15:0]  startingValue;
    input         valid;
    output        ready;
    output [15:0] fibNum;

    reg           ready;
    reg [15:0]    myValue;
    reg [15:0]    fibNum;

    initial
        begin
            ready = 0;
            #10 ready = 1;
            $monitor ($time, "fibNum=%d, startingValue=%d", fibNum, startingValue);
        end

    always
        begin
            wait (valid == 0)
                myValue = startingValue;
            ready = 0;
            #10 ready = 1;    //signal ready for input

            for (fibNum = 0; myValue != 0; myValue = myValue - 1)
                fibNum = fibNum + myValue;
            
            if (fibNum%3 == 0) and (fibNum%5 == 0) then
				$display ("FizzBuzz");
  			else if (fibNum % 3 == 0) then
				$display ("Fizz") ;
  			else if (fibNum % 5 == 0) then
				$display ("Buzz") ;
  			else /* fibNum is not divisible by 3 or 5 */
            	$display ("%d, fibNum=%d", $time, fibNum);
  			end if
        end
endmodule