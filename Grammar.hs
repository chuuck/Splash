{-# OPTIONS_GHC -w #-}
module Grammar where 
import Tokens
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.12

data HappyAbsSyn t4 t5 t6 t7 t8
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,268) ([512,61456,33015,1,0,0,0,0,0,0,41412,61439,785,0,0,4096,0,0,32768,2048,49216,991,6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,0,0,0,4,0,0,0,0,0,0,0,0,2048,0,0,0,0,0,0,0,0,0,10,0,0,32,32513,6159,0,0,15104,2049,49216,991,16390,512,7934,48,4098,63472,384,16384,1,0,14336,1008,512,1024,0,0,4096,0,0,0,0,0,0,16392,57280,1539,64,65026,12318,512,61456,33015,4097,32896,1983,32780,1024,15868,96,8196,61408,769,32,32513,6159,256,63496,49275,2048,49216,991,16390,512,7934,48,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,32768,1024,15868,96,0,0,0,0,0,0,256,63496,49275,49152,16131,8192,0,63518,1,1,49392,15,8,64,0,0,512,0,0,4096,0,0,32768,0,0,0,4,0,0,0,0,0,7168,0,0,4096,0,0,32768,0,0,0,4,0,0,32,0,0,32,32513,6159,32768,0,0,0,4,0,0,0,0,0,49376,15,8,1792,0,0,0,0,0,0,0,0,0,64527,32768,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,61496,3,2,9220,61408,769,8224,32513,6159,28672,2016,1024,0,0,32,0,0,0,0,256,0,0,0,0,0,32896,64516,24637,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseCalc","Exps","ExpList","Exp","Type","Block","'='","'\"'","'.'","'('","')'","'+'","'-'","'*'","'{'","'}'","';'","']'","'['","','","'>'","'<'","'<='","'>='","'=='","'!='","Boolean","Integer","Str","List","File","print","if","else","true","false","while","end","println","push","pop","modulo","length","sum","reverse","int","var","readFLine","%eof"]
        bit_start = st * 51
        bit_end = (st + 1) * 51
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..50]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (10) = happyShift action_5
action_0 (21) = happyShift action_6
action_0 (29) = happyShift action_7
action_0 (30) = happyShift action_8
action_0 (31) = happyShift action_9
action_0 (32) = happyShift action_10
action_0 (33) = happyShift action_11
action_0 (34) = happyShift action_12
action_0 (35) = happyShift action_13
action_0 (37) = happyShift action_14
action_0 (38) = happyShift action_15
action_0 (39) = happyShift action_16
action_0 (40) = happyShift action_17
action_0 (48) = happyShift action_18
action_0 (49) = happyShift action_19
action_0 (4) = happyGoto action_2
action_0 (6) = happyGoto action_3
action_0 (7) = happyGoto action_4
action_0 _ = happyReduce_1

action_1 _ = happyFail (happyExpListPerState 1)

action_2 (51) = happyAccept
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (10) = happyShift action_5
action_3 (14) = happyShift action_30
action_3 (15) = happyShift action_31
action_3 (16) = happyShift action_32
action_3 (21) = happyShift action_6
action_3 (23) = happyShift action_33
action_3 (24) = happyShift action_34
action_3 (25) = happyShift action_35
action_3 (26) = happyShift action_36
action_3 (27) = happyShift action_37
action_3 (28) = happyShift action_38
action_3 (29) = happyShift action_7
action_3 (30) = happyShift action_8
action_3 (31) = happyShift action_9
action_3 (32) = happyShift action_10
action_3 (33) = happyShift action_11
action_3 (34) = happyShift action_12
action_3 (35) = happyShift action_13
action_3 (37) = happyShift action_14
action_3 (38) = happyShift action_15
action_3 (39) = happyShift action_16
action_3 (40) = happyShift action_17
action_3 (44) = happyShift action_39
action_3 (48) = happyShift action_18
action_3 (49) = happyShift action_19
action_3 (4) = happyGoto action_29
action_3 (6) = happyGoto action_3
action_3 (7) = happyGoto action_4
action_3 _ = happyReduce_1

action_4 (49) = happyShift action_28
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (49) = happyShift action_27
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (10) = happyShift action_5
action_6 (21) = happyShift action_6
action_6 (29) = happyShift action_7
action_6 (30) = happyShift action_8
action_6 (31) = happyShift action_9
action_6 (32) = happyShift action_10
action_6 (33) = happyShift action_11
action_6 (34) = happyShift action_12
action_6 (35) = happyShift action_13
action_6 (37) = happyShift action_14
action_6 (38) = happyShift action_15
action_6 (39) = happyShift action_16
action_6 (40) = happyShift action_17
action_6 (48) = happyShift action_18
action_6 (49) = happyShift action_19
action_6 (5) = happyGoto action_25
action_6 (6) = happyGoto action_26
action_6 (7) = happyGoto action_4
action_6 _ = happyReduce_5

action_7 _ = happyReduce_39

action_8 _ = happyReduce_35

action_9 _ = happyReduce_36

action_10 _ = happyReduce_38

action_11 _ = happyReduce_37

action_12 (12) = happyShift action_24
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (12) = happyShift action_23
action_13 _ = happyFail (happyExpListPerState 13)

action_14 _ = happyReduce_9

action_15 _ = happyReduce_10

action_16 (12) = happyShift action_22
action_16 _ = happyFail (happyExpListPerState 16)

action_17 _ = happyReduce_19

action_18 _ = happyReduce_8

action_19 (9) = happyShift action_20
action_19 (11) = happyShift action_21
action_19 _ = happyReduce_14

action_20 (10) = happyShift action_5
action_20 (21) = happyShift action_6
action_20 (29) = happyShift action_7
action_20 (30) = happyShift action_8
action_20 (31) = happyShift action_9
action_20 (32) = happyShift action_10
action_20 (33) = happyShift action_11
action_20 (34) = happyShift action_12
action_20 (35) = happyShift action_13
action_20 (37) = happyShift action_14
action_20 (38) = happyShift action_15
action_20 (39) = happyShift action_16
action_20 (40) = happyShift action_17
action_20 (48) = happyShift action_18
action_20 (49) = happyShift action_19
action_20 (6) = happyGoto action_63
action_20 (7) = happyGoto action_4
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (42) = happyShift action_57
action_21 (43) = happyShift action_58
action_21 (45) = happyShift action_59
action_21 (46) = happyShift action_60
action_21 (47) = happyShift action_61
action_21 (50) = happyShift action_62
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (10) = happyShift action_5
action_22 (21) = happyShift action_6
action_22 (29) = happyShift action_7
action_22 (30) = happyShift action_8
action_22 (31) = happyShift action_9
action_22 (32) = happyShift action_10
action_22 (33) = happyShift action_11
action_22 (34) = happyShift action_12
action_22 (35) = happyShift action_13
action_22 (37) = happyShift action_14
action_22 (38) = happyShift action_15
action_22 (39) = happyShift action_16
action_22 (40) = happyShift action_17
action_22 (48) = happyShift action_18
action_22 (49) = happyShift action_19
action_22 (6) = happyGoto action_56
action_22 (7) = happyGoto action_4
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (10) = happyShift action_5
action_23 (21) = happyShift action_6
action_23 (29) = happyShift action_7
action_23 (30) = happyShift action_8
action_23 (31) = happyShift action_9
action_23 (32) = happyShift action_10
action_23 (33) = happyShift action_11
action_23 (34) = happyShift action_12
action_23 (35) = happyShift action_13
action_23 (37) = happyShift action_14
action_23 (38) = happyShift action_15
action_23 (39) = happyShift action_16
action_23 (40) = happyShift action_17
action_23 (48) = happyShift action_18
action_23 (49) = happyShift action_19
action_23 (6) = happyGoto action_55
action_23 (7) = happyGoto action_4
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (10) = happyShift action_5
action_24 (21) = happyShift action_6
action_24 (29) = happyShift action_7
action_24 (30) = happyShift action_8
action_24 (31) = happyShift action_9
action_24 (32) = happyShift action_10
action_24 (33) = happyShift action_11
action_24 (34) = happyShift action_12
action_24 (35) = happyShift action_13
action_24 (37) = happyShift action_14
action_24 (38) = happyShift action_15
action_24 (39) = happyShift action_16
action_24 (40) = happyShift action_17
action_24 (48) = happyShift action_18
action_24 (49) = happyShift action_19
action_24 (6) = happyGoto action_54
action_24 (7) = happyGoto action_4
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (20) = happyShift action_52
action_25 (22) = happyShift action_53
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (14) = happyShift action_30
action_26 (15) = happyShift action_31
action_26 (16) = happyShift action_32
action_26 (23) = happyShift action_33
action_26 (24) = happyShift action_34
action_26 (25) = happyShift action_35
action_26 (26) = happyShift action_36
action_26 (27) = happyShift action_37
action_26 (28) = happyShift action_38
action_26 (44) = happyShift action_39
action_26 _ = happyReduce_4

action_27 (10) = happyShift action_51
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (9) = happyShift action_50
action_28 _ = happyFail (happyExpListPerState 28)

action_29 _ = happyReduce_2

action_30 (10) = happyShift action_5
action_30 (21) = happyShift action_6
action_30 (29) = happyShift action_7
action_30 (30) = happyShift action_8
action_30 (31) = happyShift action_9
action_30 (32) = happyShift action_10
action_30 (33) = happyShift action_11
action_30 (34) = happyShift action_12
action_30 (35) = happyShift action_13
action_30 (37) = happyShift action_14
action_30 (38) = happyShift action_15
action_30 (39) = happyShift action_16
action_30 (40) = happyShift action_17
action_30 (48) = happyShift action_18
action_30 (49) = happyShift action_19
action_30 (6) = happyGoto action_49
action_30 (7) = happyGoto action_4
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (10) = happyShift action_5
action_31 (21) = happyShift action_6
action_31 (29) = happyShift action_7
action_31 (30) = happyShift action_8
action_31 (31) = happyShift action_9
action_31 (32) = happyShift action_10
action_31 (33) = happyShift action_11
action_31 (34) = happyShift action_12
action_31 (35) = happyShift action_13
action_31 (37) = happyShift action_14
action_31 (38) = happyShift action_15
action_31 (39) = happyShift action_16
action_31 (40) = happyShift action_17
action_31 (48) = happyShift action_18
action_31 (49) = happyShift action_19
action_31 (6) = happyGoto action_48
action_31 (7) = happyGoto action_4
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (10) = happyShift action_5
action_32 (21) = happyShift action_6
action_32 (29) = happyShift action_7
action_32 (30) = happyShift action_8
action_32 (31) = happyShift action_9
action_32 (32) = happyShift action_10
action_32 (33) = happyShift action_11
action_32 (34) = happyShift action_12
action_32 (35) = happyShift action_13
action_32 (37) = happyShift action_14
action_32 (38) = happyShift action_15
action_32 (39) = happyShift action_16
action_32 (40) = happyShift action_17
action_32 (48) = happyShift action_18
action_32 (49) = happyShift action_19
action_32 (6) = happyGoto action_47
action_32 (7) = happyGoto action_4
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (10) = happyShift action_5
action_33 (21) = happyShift action_6
action_33 (29) = happyShift action_7
action_33 (30) = happyShift action_8
action_33 (31) = happyShift action_9
action_33 (32) = happyShift action_10
action_33 (33) = happyShift action_11
action_33 (34) = happyShift action_12
action_33 (35) = happyShift action_13
action_33 (37) = happyShift action_14
action_33 (38) = happyShift action_15
action_33 (39) = happyShift action_16
action_33 (40) = happyShift action_17
action_33 (48) = happyShift action_18
action_33 (49) = happyShift action_19
action_33 (6) = happyGoto action_46
action_33 (7) = happyGoto action_4
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (10) = happyShift action_5
action_34 (21) = happyShift action_6
action_34 (29) = happyShift action_7
action_34 (30) = happyShift action_8
action_34 (31) = happyShift action_9
action_34 (32) = happyShift action_10
action_34 (33) = happyShift action_11
action_34 (34) = happyShift action_12
action_34 (35) = happyShift action_13
action_34 (37) = happyShift action_14
action_34 (38) = happyShift action_15
action_34 (39) = happyShift action_16
action_34 (40) = happyShift action_17
action_34 (48) = happyShift action_18
action_34 (49) = happyShift action_19
action_34 (6) = happyGoto action_45
action_34 (7) = happyGoto action_4
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (10) = happyShift action_5
action_35 (21) = happyShift action_6
action_35 (29) = happyShift action_7
action_35 (30) = happyShift action_8
action_35 (31) = happyShift action_9
action_35 (32) = happyShift action_10
action_35 (33) = happyShift action_11
action_35 (34) = happyShift action_12
action_35 (35) = happyShift action_13
action_35 (37) = happyShift action_14
action_35 (38) = happyShift action_15
action_35 (39) = happyShift action_16
action_35 (40) = happyShift action_17
action_35 (48) = happyShift action_18
action_35 (49) = happyShift action_19
action_35 (6) = happyGoto action_44
action_35 (7) = happyGoto action_4
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (10) = happyShift action_5
action_36 (21) = happyShift action_6
action_36 (29) = happyShift action_7
action_36 (30) = happyShift action_8
action_36 (31) = happyShift action_9
action_36 (32) = happyShift action_10
action_36 (33) = happyShift action_11
action_36 (34) = happyShift action_12
action_36 (35) = happyShift action_13
action_36 (37) = happyShift action_14
action_36 (38) = happyShift action_15
action_36 (39) = happyShift action_16
action_36 (40) = happyShift action_17
action_36 (48) = happyShift action_18
action_36 (49) = happyShift action_19
action_36 (6) = happyGoto action_43
action_36 (7) = happyGoto action_4
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (10) = happyShift action_5
action_37 (21) = happyShift action_6
action_37 (29) = happyShift action_7
action_37 (30) = happyShift action_8
action_37 (31) = happyShift action_9
action_37 (32) = happyShift action_10
action_37 (33) = happyShift action_11
action_37 (34) = happyShift action_12
action_37 (35) = happyShift action_13
action_37 (37) = happyShift action_14
action_37 (38) = happyShift action_15
action_37 (39) = happyShift action_16
action_37 (40) = happyShift action_17
action_37 (48) = happyShift action_18
action_37 (49) = happyShift action_19
action_37 (6) = happyGoto action_42
action_37 (7) = happyGoto action_4
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (10) = happyShift action_5
action_38 (21) = happyShift action_6
action_38 (29) = happyShift action_7
action_38 (30) = happyShift action_8
action_38 (31) = happyShift action_9
action_38 (32) = happyShift action_10
action_38 (33) = happyShift action_11
action_38 (34) = happyShift action_12
action_38 (35) = happyShift action_13
action_38 (37) = happyShift action_14
action_38 (38) = happyShift action_15
action_38 (39) = happyShift action_16
action_38 (40) = happyShift action_17
action_38 (48) = happyShift action_18
action_38 (49) = happyShift action_19
action_38 (6) = happyGoto action_41
action_38 (7) = happyGoto action_4
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (10) = happyShift action_5
action_39 (21) = happyShift action_6
action_39 (29) = happyShift action_7
action_39 (30) = happyShift action_8
action_39 (31) = happyShift action_9
action_39 (32) = happyShift action_10
action_39 (33) = happyShift action_11
action_39 (34) = happyShift action_12
action_39 (35) = happyShift action_13
action_39 (37) = happyShift action_14
action_39 (38) = happyShift action_15
action_39 (39) = happyShift action_16
action_39 (40) = happyShift action_17
action_39 (48) = happyShift action_18
action_39 (49) = happyShift action_19
action_39 (6) = happyGoto action_40
action_39 (7) = happyGoto action_4
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (14) = happyShift action_30
action_40 (15) = happyShift action_31
action_40 (16) = happyShift action_32
action_40 (23) = happyShift action_33
action_40 (24) = happyShift action_34
action_40 (25) = happyShift action_35
action_40 (26) = happyShift action_36
action_40 (27) = happyShift action_37
action_40 (28) = happyShift action_38
action_40 (44) = happyShift action_39
action_40 _ = happyReduce_30

action_41 (14) = happyShift action_30
action_41 (15) = happyShift action_31
action_41 (16) = happyShift action_32
action_41 (23) = happyShift action_33
action_41 (24) = happyShift action_34
action_41 (25) = happyShift action_35
action_41 (26) = happyShift action_36
action_41 (27) = happyShift action_37
action_41 (28) = happyShift action_38
action_41 (44) = happyShift action_39
action_41 _ = happyReduce_26

action_42 (14) = happyShift action_30
action_42 (15) = happyShift action_31
action_42 (16) = happyShift action_32
action_42 (23) = happyShift action_33
action_42 (24) = happyShift action_34
action_42 (25) = happyShift action_35
action_42 (26) = happyShift action_36
action_42 (27) = happyShift action_37
action_42 (28) = happyShift action_38
action_42 (44) = happyShift action_39
action_42 _ = happyReduce_25

action_43 (14) = happyShift action_30
action_43 (15) = happyShift action_31
action_43 (16) = happyShift action_32
action_43 (23) = happyShift action_33
action_43 (24) = happyShift action_34
action_43 (25) = happyShift action_35
action_43 (26) = happyShift action_36
action_43 (27) = happyShift action_37
action_43 (28) = happyShift action_38
action_43 (44) = happyShift action_39
action_43 _ = happyReduce_24

action_44 (14) = happyShift action_30
action_44 (15) = happyShift action_31
action_44 (16) = happyShift action_32
action_44 (23) = happyShift action_33
action_44 (24) = happyShift action_34
action_44 (25) = happyShift action_35
action_44 (26) = happyShift action_36
action_44 (27) = happyShift action_37
action_44 (28) = happyShift action_38
action_44 (44) = happyShift action_39
action_44 _ = happyReduce_23

action_45 (14) = happyShift action_30
action_45 (15) = happyShift action_31
action_45 (16) = happyShift action_32
action_45 (23) = happyShift action_33
action_45 (24) = happyShift action_34
action_45 (25) = happyShift action_35
action_45 (26) = happyShift action_36
action_45 (27) = happyShift action_37
action_45 (28) = happyShift action_38
action_45 (44) = happyShift action_39
action_45 _ = happyReduce_22

action_46 (14) = happyShift action_30
action_46 (15) = happyShift action_31
action_46 (16) = happyShift action_32
action_46 (23) = happyShift action_33
action_46 (24) = happyShift action_34
action_46 (25) = happyShift action_35
action_46 (26) = happyShift action_36
action_46 (27) = happyShift action_37
action_46 (28) = happyShift action_38
action_46 (44) = happyShift action_39
action_46 _ = happyReduce_21

action_47 (23) = happyShift action_33
action_47 (24) = happyShift action_34
action_47 (25) = happyShift action_35
action_47 (26) = happyShift action_36
action_47 (27) = happyShift action_37
action_47 (28) = happyShift action_38
action_47 (44) = happyShift action_39
action_47 _ = happyReduce_17

action_48 (23) = happyShift action_33
action_48 (24) = happyShift action_34
action_48 (25) = happyShift action_35
action_48 (26) = happyShift action_36
action_48 (27) = happyShift action_37
action_48 (28) = happyShift action_38
action_48 (44) = happyShift action_39
action_48 _ = happyReduce_16

action_49 (23) = happyShift action_33
action_49 (24) = happyShift action_34
action_49 (25) = happyShift action_35
action_49 (26) = happyShift action_36
action_49 (27) = happyShift action_37
action_49 (28) = happyShift action_38
action_49 (44) = happyShift action_39
action_49 _ = happyReduce_15

action_50 (10) = happyShift action_5
action_50 (21) = happyShift action_6
action_50 (29) = happyShift action_7
action_50 (30) = happyShift action_8
action_50 (31) = happyShift action_9
action_50 (32) = happyShift action_10
action_50 (33) = happyShift action_11
action_50 (34) = happyShift action_12
action_50 (35) = happyShift action_13
action_50 (37) = happyShift action_14
action_50 (38) = happyShift action_15
action_50 (39) = happyShift action_16
action_50 (40) = happyShift action_17
action_50 (48) = happyShift action_18
action_50 (49) = happyShift action_19
action_50 (6) = happyGoto action_73
action_50 (7) = happyGoto action_4
action_50 _ = happyFail (happyExpListPerState 50)

action_51 _ = happyReduce_11

action_52 _ = happyReduce_20

action_53 (10) = happyShift action_5
action_53 (21) = happyShift action_6
action_53 (29) = happyShift action_7
action_53 (30) = happyShift action_8
action_53 (31) = happyShift action_9
action_53 (32) = happyShift action_10
action_53 (33) = happyShift action_11
action_53 (34) = happyShift action_12
action_53 (35) = happyShift action_13
action_53 (37) = happyShift action_14
action_53 (38) = happyShift action_15
action_53 (39) = happyShift action_16
action_53 (40) = happyShift action_17
action_53 (48) = happyShift action_18
action_53 (49) = happyShift action_19
action_53 (6) = happyGoto action_72
action_53 (7) = happyGoto action_4
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (13) = happyShift action_71
action_54 (14) = happyShift action_30
action_54 (15) = happyShift action_31
action_54 (16) = happyShift action_32
action_54 (23) = happyShift action_33
action_54 (24) = happyShift action_34
action_54 (25) = happyShift action_35
action_54 (26) = happyShift action_36
action_54 (27) = happyShift action_37
action_54 (28) = happyShift action_38
action_54 (44) = happyShift action_39
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (13) = happyShift action_70
action_55 (14) = happyShift action_30
action_55 (15) = happyShift action_31
action_55 (16) = happyShift action_32
action_55 (23) = happyShift action_33
action_55 (24) = happyShift action_34
action_55 (25) = happyShift action_35
action_55 (26) = happyShift action_36
action_55 (27) = happyShift action_37
action_55 (28) = happyShift action_38
action_55 (44) = happyShift action_39
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (13) = happyShift action_69
action_56 (14) = happyShift action_30
action_56 (15) = happyShift action_31
action_56 (16) = happyShift action_32
action_56 (23) = happyShift action_33
action_56 (24) = happyShift action_34
action_56 (25) = happyShift action_35
action_56 (26) = happyShift action_36
action_56 (27) = happyShift action_37
action_56 (28) = happyShift action_38
action_56 (44) = happyShift action_39
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (12) = happyShift action_68
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (12) = happyShift action_67
action_58 _ = happyFail (happyExpListPerState 58)

action_59 (12) = happyShift action_66
action_59 _ = happyFail (happyExpListPerState 59)

action_60 (12) = happyShift action_65
action_60 _ = happyFail (happyExpListPerState 60)

action_61 (12) = happyShift action_64
action_61 _ = happyFail (happyExpListPerState 61)

action_62 _ = happyReduce_12

action_63 (14) = happyShift action_30
action_63 (15) = happyShift action_31
action_63 (16) = happyShift action_32
action_63 (23) = happyShift action_33
action_63 (24) = happyShift action_34
action_63 (25) = happyShift action_35
action_63 (26) = happyShift action_36
action_63 (27) = happyShift action_37
action_63 (28) = happyShift action_38
action_63 (44) = happyShift action_39
action_63 _ = happyReduce_7

action_64 (13) = happyShift action_80
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (13) = happyShift action_79
action_65 _ = happyFail (happyExpListPerState 65)

action_66 (13) = happyShift action_78
action_66 _ = happyFail (happyExpListPerState 66)

action_67 (13) = happyShift action_77
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (10) = happyShift action_5
action_68 (21) = happyShift action_6
action_68 (29) = happyShift action_7
action_68 (30) = happyShift action_8
action_68 (31) = happyShift action_9
action_68 (32) = happyShift action_10
action_68 (33) = happyShift action_11
action_68 (34) = happyShift action_12
action_68 (35) = happyShift action_13
action_68 (37) = happyShift action_14
action_68 (38) = happyShift action_15
action_68 (39) = happyShift action_16
action_68 (40) = happyShift action_17
action_68 (48) = happyShift action_18
action_68 (49) = happyShift action_19
action_68 (6) = happyGoto action_76
action_68 (7) = happyGoto action_4
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (17) = happyShift action_75
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (17) = happyShift action_74
action_70 _ = happyFail (happyExpListPerState 70)

action_71 _ = happyReduce_13

action_72 (14) = happyShift action_30
action_72 (15) = happyShift action_31
action_72 (16) = happyShift action_32
action_72 (23) = happyShift action_33
action_72 (24) = happyShift action_34
action_72 (25) = happyShift action_35
action_72 (26) = happyShift action_36
action_72 (27) = happyShift action_37
action_72 (28) = happyShift action_38
action_72 (44) = happyShift action_39
action_72 _ = happyReduce_3

action_73 (14) = happyShift action_30
action_73 (15) = happyShift action_31
action_73 (16) = happyShift action_32
action_73 (23) = happyShift action_33
action_73 (24) = happyShift action_34
action_73 (25) = happyShift action_35
action_73 (26) = happyShift action_36
action_73 (27) = happyShift action_37
action_73 (28) = happyShift action_38
action_73 (44) = happyShift action_39
action_73 _ = happyReduce_6

action_74 (10) = happyShift action_5
action_74 (21) = happyShift action_6
action_74 (29) = happyShift action_7
action_74 (30) = happyShift action_8
action_74 (31) = happyShift action_9
action_74 (32) = happyShift action_10
action_74 (33) = happyShift action_11
action_74 (34) = happyShift action_12
action_74 (35) = happyShift action_13
action_74 (37) = happyShift action_14
action_74 (38) = happyShift action_15
action_74 (39) = happyShift action_16
action_74 (40) = happyShift action_17
action_74 (48) = happyShift action_18
action_74 (49) = happyShift action_19
action_74 (6) = happyGoto action_82
action_74 (7) = happyGoto action_4
action_74 (8) = happyGoto action_84
action_74 _ = happyReduce_42

action_75 (10) = happyShift action_5
action_75 (21) = happyShift action_6
action_75 (29) = happyShift action_7
action_75 (30) = happyShift action_8
action_75 (31) = happyShift action_9
action_75 (32) = happyShift action_10
action_75 (33) = happyShift action_11
action_75 (34) = happyShift action_12
action_75 (35) = happyShift action_13
action_75 (37) = happyShift action_14
action_75 (38) = happyShift action_15
action_75 (39) = happyShift action_16
action_75 (40) = happyShift action_17
action_75 (48) = happyShift action_18
action_75 (49) = happyShift action_19
action_75 (6) = happyGoto action_82
action_75 (7) = happyGoto action_4
action_75 (8) = happyGoto action_83
action_75 _ = happyReduce_42

action_76 (13) = happyShift action_81
action_76 (14) = happyShift action_30
action_76 (15) = happyShift action_31
action_76 (16) = happyShift action_32
action_76 (23) = happyShift action_33
action_76 (24) = happyShift action_34
action_76 (25) = happyShift action_35
action_76 (26) = happyShift action_36
action_76 (27) = happyShift action_37
action_76 (28) = happyShift action_38
action_76 (44) = happyShift action_39
action_76 _ = happyFail (happyExpListPerState 76)

action_77 _ = happyReduce_27

action_78 _ = happyReduce_31

action_79 _ = happyReduce_33

action_80 _ = happyReduce_34

action_81 _ = happyReduce_28

action_82 (14) = happyShift action_30
action_82 (15) = happyShift action_31
action_82 (16) = happyShift action_32
action_82 (23) = happyShift action_33
action_82 (24) = happyShift action_34
action_82 (25) = happyShift action_35
action_82 (26) = happyShift action_36
action_82 (27) = happyShift action_37
action_82 (28) = happyShift action_38
action_82 (44) = happyShift action_39
action_82 _ = happyReduce_41

action_83 (10) = happyShift action_5
action_83 (18) = happyShift action_87
action_83 (21) = happyShift action_6
action_83 (29) = happyShift action_7
action_83 (30) = happyShift action_8
action_83 (31) = happyShift action_9
action_83 (32) = happyShift action_10
action_83 (33) = happyShift action_11
action_83 (34) = happyShift action_12
action_83 (35) = happyShift action_13
action_83 (37) = happyShift action_14
action_83 (38) = happyShift action_15
action_83 (39) = happyShift action_16
action_83 (40) = happyShift action_17
action_83 (48) = happyShift action_18
action_83 (49) = happyShift action_19
action_83 (6) = happyGoto action_85
action_83 (7) = happyGoto action_4
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (10) = happyShift action_5
action_84 (18) = happyShift action_86
action_84 (21) = happyShift action_6
action_84 (29) = happyShift action_7
action_84 (30) = happyShift action_8
action_84 (31) = happyShift action_9
action_84 (32) = happyShift action_10
action_84 (33) = happyShift action_11
action_84 (34) = happyShift action_12
action_84 (35) = happyShift action_13
action_84 (37) = happyShift action_14
action_84 (38) = happyShift action_15
action_84 (39) = happyShift action_16
action_84 (40) = happyShift action_17
action_84 (48) = happyShift action_18
action_84 (49) = happyShift action_19
action_84 (6) = happyGoto action_85
action_84 (7) = happyGoto action_4
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (14) = happyShift action_30
action_85 (15) = happyShift action_31
action_85 (16) = happyShift action_32
action_85 (23) = happyShift action_33
action_85 (24) = happyShift action_34
action_85 (25) = happyShift action_35
action_85 (26) = happyShift action_36
action_85 (27) = happyShift action_37
action_85 (28) = happyShift action_38
action_85 (44) = happyShift action_39
action_85 _ = happyReduce_40

action_86 (36) = happyShift action_88
action_86 _ = happyReduce_32

action_87 _ = happyReduce_29

action_88 (17) = happyShift action_89
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (10) = happyShift action_5
action_89 (21) = happyShift action_6
action_89 (29) = happyShift action_7
action_89 (30) = happyShift action_8
action_89 (31) = happyShift action_9
action_89 (32) = happyShift action_10
action_89 (33) = happyShift action_11
action_89 (34) = happyShift action_12
action_89 (35) = happyShift action_13
action_89 (37) = happyShift action_14
action_89 (38) = happyShift action_15
action_89 (39) = happyShift action_16
action_89 (40) = happyShift action_17
action_89 (48) = happyShift action_18
action_89 (49) = happyShift action_19
action_89 (6) = happyGoto action_82
action_89 (7) = happyGoto action_4
action_89 (8) = happyGoto action_90
action_89 _ = happyReduce_42

action_90 (10) = happyShift action_5
action_90 (18) = happyShift action_91
action_90 (21) = happyShift action_6
action_90 (29) = happyShift action_7
action_90 (30) = happyShift action_8
action_90 (31) = happyShift action_9
action_90 (32) = happyShift action_10
action_90 (33) = happyShift action_11
action_90 (34) = happyShift action_12
action_90 (35) = happyShift action_13
action_90 (37) = happyShift action_14
action_90 (38) = happyShift action_15
action_90 (39) = happyShift action_16
action_90 (40) = happyShift action_17
action_90 (48) = happyShift action_18
action_90 (49) = happyShift action_19
action_90 (6) = happyGoto action_85
action_90 (7) = happyGoto action_4
action_90 _ = happyFail (happyExpListPerState 90)

action_91 _ = happyReduce_18

happyReduce_1 = happySpecReduce_0  4 happyReduction_1
happyReduction_1  =  HappyAbsSyn4
		 ([]
	)

happyReduce_2 = happySpecReduce_2  4 happyReduction_2
happyReduction_2 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1 : happy_var_2
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_3  5 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 ((happy_var_1 ++ [happy_var_3])
	)
happyReduction_3 _ _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  5 happyReduction_4
happyReduction_4 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_1]
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_0  5 happyReduction_5
happyReduction_5  =  HappyAbsSyn5
		 ([]
	)

happyReduce_6 = happyReduce 4 6 happyReduction_6
happyReduction_6 ((HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar _ happy_var_2)) `HappyStk`
	(HappyAbsSyn7  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Variable happy_var_1 happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_7 = happySpecReduce_3  6 happyReduction_7
happyReduction_7 (HappyAbsSyn6  happy_var_3)
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn6
		 (UpdateVar happy_var_1 happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  6 happyReduction_8
happyReduction_8 (HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn6
		 (TmInt happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  6 happyReduction_9
happyReduction_9 _
	 =  HappyAbsSyn6
		 (TTrue
	)

happyReduce_10 = happySpecReduce_1  6 happyReduction_10
happyReduction_10 _
	 =  HappyAbsSyn6
		 (TFalse
	)

happyReduce_11 = happySpecReduce_3  6 happyReduction_11
happyReduction_11 _
	(HappyTerminal (TokenVar _ happy_var_2))
	_
	 =  HappyAbsSyn6
		 (Var happy_var_2
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  6 happyReduction_12
happyReduction_12 _
	_
	(HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn6
		 (ReadFLine happy_var_1
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happyReduce 4 6 happyReduction_13
happyReduction_13 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Print happy_var_3
	) `HappyStk` happyRest

happyReduce_14 = happySpecReduce_1  6 happyReduction_14
happyReduction_14 (HappyTerminal (TokenVar _ happy_var_1))
	 =  HappyAbsSyn6
		 (VarName happy_var_1
	)
happyReduction_14 _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  6 happyReduction_15
happyReduction_15 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Plus happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  6 happyReduction_16
happyReduction_16 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Minus happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  6 happyReduction_17
happyReduction_17 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Times happy_var_1 happy_var_3
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happyReduce 11 6 happyReduction_18
happyReduction_18 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_10) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (If happy_var_3 happy_var_6 happy_var_10
	) `HappyStk` happyRest

happyReduce_19 = happySpecReduce_1  6 happyReduction_19
happyReduction_19 _
	 =  HappyAbsSyn6
		 (End
	)

happyReduce_20 = happySpecReduce_3  6 happyReduction_20
happyReduction_20 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (ListVar happy_var_2
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  6 happyReduction_21
happyReduction_21 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (GTGram happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  6 happyReduction_22
happyReduction_22 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (LTGram happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  6 happyReduction_23
happyReduction_23 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (LTEquals happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  6 happyReduction_24
happyReduction_24 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (GTEquals happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  6 happyReduction_25
happyReduction_25 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Equals happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_3  6 happyReduction_26
happyReduction_26 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (NotEquals happy_var_1 happy_var_3
	)
happyReduction_26 _ _ _  = notHappyAtAll 

happyReduce_27 = happyReduce 5 6 happyReduction_27
happyReduction_27 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Pop happy_var_1
	) `HappyStk` happyRest

happyReduce_28 = happyReduce 6 6 happyReduction_28
happyReduction_28 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Push happy_var_1 happy_var_5
	) `HappyStk` happyRest

happyReduce_29 = happyReduce 7 6 happyReduction_29
happyReduction_29 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (WhileLoop happy_var_3 happy_var_6
	) `HappyStk` happyRest

happyReduce_30 = happySpecReduce_3  6 happyReduction_30
happyReduction_30 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Modulo happy_var_1 happy_var_3
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happyReduce 5 6 happyReduction_31
happyReduction_31 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Length happy_var_1
	) `HappyStk` happyRest

happyReduce_32 = happyReduce 7 6 happyReduction_32
happyReduction_32 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (JustIf happy_var_3 happy_var_6
	) `HappyStk` happyRest

happyReduce_33 = happyReduce 5 6 happyReduction_33
happyReduction_33 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Sum happy_var_1
	) `HappyStk` happyRest

happyReduce_34 = happyReduce 5 6 happyReduction_34
happyReduction_34 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenVar _ happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (Reverse happy_var_1
	) `HappyStk` happyRest

happyReduce_35 = happySpecReduce_1  7 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn7
		 (Integer
	)

happyReduce_36 = happySpecReduce_1  7 happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn7
		 (StringT
	)

happyReduce_37 = happySpecReduce_1  7 happyReduction_37
happyReduction_37 _
	 =  HappyAbsSyn7
		 (File
	)

happyReduce_38 = happySpecReduce_1  7 happyReduction_38
happyReduction_38 _
	 =  HappyAbsSyn7
		 (List
	)

happyReduce_39 = happySpecReduce_1  7 happyReduction_39
happyReduction_39 _
	 =  HappyAbsSyn7
		 (Boolean
	)

happyReduce_40 = happySpecReduce_2  8 happyReduction_40
happyReduction_40 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 ((happy_var_1 ++ [happy_var_2])
	)
happyReduction_40 _ _  = notHappyAtAll 

happyReduce_41 = happySpecReduce_1  8 happyReduction_41
happyReduction_41 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn8
		 ([happy_var_1]
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_0  8 happyReduction_42
happyReduction_42  =  HappyAbsSyn8
		 ([]
	)

happyNewToken action sts stk [] =
	action 51 51 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenEq _ -> cont 9;
	TokenQuote _ -> cont 10;
	TokenDot _ -> cont 11;
	TokenLParen _ -> cont 12;
	TokenRParen _ -> cont 13;
	TokenPlus _ -> cont 14;
	TokenMinus _ -> cont 15;
	TokenTimes _ -> cont 16;
	TokenLCurlyBrack _ -> cont 17;
	TokenRCurlyBrack _ -> cont 18;
	TokenSemi _ -> cont 19;
	TokenRSquareBrack _ -> cont 20;
	TokenLSquareBrack _ -> cont 21;
	TokenComma _ -> cont 22;
	TokenGT _ -> cont 23;
	TokenLT _ -> cont 24;
	TokenLTEquals _ -> cont 25;
	TokenGTEquals _ -> cont 26;
	TokenEquals _ -> cont 27;
	TokenNotEquals _ -> cont 28;
	TokenTypeBoolean _ -> cont 29;
	TokenTypeInteger _ -> cont 30;
	TokenTypeString _ -> cont 31;
	TokenTypeList _ -> cont 32;
	TokenTypeFile _ -> cont 33;
	TokenPrint _ -> cont 34;
	TokenIf _ -> cont 35;
	TokenElse _ -> cont 36;
	TokenTrue _ -> cont 37;
	TokenFalse _ -> cont 38;
	TokenWhile _ -> cont 39;
	TokenEnd _ -> cont 40;
	TokenPrintln _ -> cont 41;
	TokenPush _ -> cont 42;
	TokenPop _ -> cont 43;
	TokenModulo _ -> cont 44;
	TokenLength _ -> cont 45;
	TokenSum _ -> cont 46;
	TokenReverse _ -> cont 47;
	TokenInt _ happy_dollar_dollar -> cont 48;
	TokenVar _ happy_dollar_dollar -> cont 49;
	TokenReadFLine _ -> cont 50;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 51 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
parseCalc tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError _ = error "Parse error" 

data Type = Integer
        | StringT
        | List
        | File
        | Boolean
        deriving (Show,Eq)

type Environment = [ (String,Exp) ]

type ExpList = [Exp]

type Block = [Exp]

data Exp =
        Variable Type String Exp
        | TmInt Int
        | Var String
        | ReadFLine String
        | Print Exp
        | VarName String
        | Plus Exp Exp
        | Minus Exp Exp
        | Times Exp Exp
        | If Exp Block Block
        | TTrue
        | TFalse
        | End
        | ListVar ExpList
        | GTGram Exp Exp
        | LTGram Exp Exp
        | LTEquals Exp Exp
        | GTEquals Exp Exp
        | Equals Exp Exp
        | Pop String
        | Push String Exp
        | UpdateVar String Exp
        | WhileLoop Exp Block
        | Modulo Exp Exp
        | Length String
        | NotEquals Exp Exp
        | JustIf Exp Block
        | Sum String
        | Reverse String
    

         deriving (Show,Eq)
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
