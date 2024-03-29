LisEqBody:
        PUSH(FP);
        MOV(FP, SP);
        PUSH(R1);
        PUSH(R2);
        PUSH(R3);
        PUSH(R4);
        PUSH(R5);
        PUSH(R6);
        PUSH(R7);
        PUSH(R8);
        PUSH(R9);
        PUSH(R10);
        PUSH(R11);
        PUSH(R12);
        PUSH(R13);
        PUSH(R14);
  
  CMP(FPARG(1), IMM(2));
  JUMP_NE(L_error_incorrect_num_of_args);
  
  MOV(R1,FPARG(2));
  MOV(R2,FPARG(3));
  CMP(IND(R1),IND(R2));
  JUMP_NE(LisEqBodyFalse);
  CMP(IND(R1),IMM(T_INTEGER));
  JUMP_EQ(LisEqBodyIntegers);
  CMP(IND(R1),IMM(T_FRACTION));
  JUMP_EQ(LisEqBodyFractions);
  CMP(IND(R1),IMM(T_CHAR));
  JUMP_EQ(LisEqBodyChars);
  CMP(IND(R1),IMM(T_SYMBOL));
  JUMP_EQ(LisBodySymbols);
  CMP(IND(R1),IMM(T_NIL));
  JUMP_EQ(LisBodyNil);
  CMP(IND(R1),IMM(T_BOOL));
  JUMP_EQ(LisBodyBool);
  CMP(IND(R1),IMM(T_STRING));
  JUMP_EQ(LisBodyString);
  CMP(IND(R1),IMM(T_VECTOR));
  JUMP_EQ(LisBodyVector);
  CMP(IND(R1),IMM(T_PAIR));
  JUMP_EQ(LisBodyPair);
  CMP(IND(R1),IMM(T_CLOSURE));
  JUMP_EQ(LisBodyClosure);
  
LisEqBodyIntegers:
  JUMP(LisEqBodyCompareValues);
LisEqBodyFractions:
  JUMP(LisEqBodyCompareValues);
LisEqBodyChars:
  JUMP(LisEqBodyCompareValues);
LisBodySymbols:
  JUMP(LisEqBodyCompareValues);
LisBodyNil:
  JUMP(LisEqBodyCompareAddresses);
LisBodyBool:
  JUMP(LisEqBodyCompareAddresses);
LisBodyString:
  JUMP(LisEqBodyCompareAddresses);
LisBodyVector:
  JUMP(LisEqBodyCompareAddresses);
LisBodyPair:
  JUMP(LisEqBodyCompareAddresses);
LisBodyClosure:
  JUMP(LisEqBodyCompareAddresses);

LisEqBodyCompareValues:
  CMP(INDD(R1,1),INDD(R2,1));
  JUMP_EQ(LisEqBodyTrue);
  JUMP_NE(LisEqBodyFalse);
LisEqBodyCompareAddresses:
  CMP(R1,R2);
  JUMP_EQ(LisEqBodyTrue);
  JUMP_NE(LisEqBodyFalse);
  
LisEqBodyTrue:
  //SHOW("REACHED TRUE", R0);
  //PUSH(IMM(1));
  MOV(R0,IMM(SOB_TRUE));
  JUMP(LisEqBodyExit);
LisEqBodyFalse:
  //SHOW("REACHED FALSE", R0);
  //PUSH(IMM(0));
  MOV(R0,IMM(SOB_FALSE));
LisEqBodyExit:
  //CALL(MAKE_SOB_BOOL);
  //DROP(1);
        POP(R14);
        POP(R13);
        POP(R12);
        POP(R11);
        POP(R10);
        POP(R9);
        POP(R8);
        POP(R7);
        POP(R6);
        POP(R5);
        POP(R4);
        POP(R3);
        POP(R2);
        POP(R1);
        POP(FP);
        RETURN;
