LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY carry_select_adder IS
    PORT (
        A : INOUT STD_LOGIC_VECTOR (15 DOWNTO 0) := "0000000000000001";
        B : INOUT STD_LOGIC_VECTOR (15 DOWNTO 0) := "1000000000000000";
        CIN : INOUT STD_LOGIC := '0';
        S : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
        COUT : OUT STD_LOGIC);
END carry_select_adder;

ARCHITECTURE Behavioral OF carry_select_adder IS

    COMPONENT full_adder
        PORT (
            A : IN STD_LOGIC;
            B : IN STD_LOGIC;
            Cin : IN STD_LOGIC;
            S : OUT STD_LOGIC;
            Cout : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT mux2_1
        PORT (
            A, B : IN STD_LOGIC;
            Sel : IN STD_LOGIC;
            Z : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL C0, MUX_OUTPUT0, MUX_OUTPUT1, MUX_OUTPUT2 : STD_LOGIC;
    SIGNAL MUX_INPUT0, MUX_INPUT1, MUX_INPUT2, MUX_INPUT3 : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15, S16 : STD_LOGIC_VECTOR(1 DOWNTO 0);
BEGIN

    FULLADDER1 : full_adder PORT MAP(A => A(0), B => B(0), Cin => '0', S => S(0));
    FULLADDER2 : full_adder PORT MAP(A => A(1), B => B(1), Cin => '0', S => S(1), COUT => C0);
    --1
    --12
    FULLADDER3 : full_adder PORT MAP(A => A(2), B => B(2), Cin => '0', S => S2(0));
    FULLADDER4 : full_adder PORT MAP(A => A(2), B => B(2), Cin => '1', S => S2(1));
    MUX0 : mux2_1 PORT MAP(A => S2(0), B => S2(1), Sel => C0, Z => S(2));
    --13
    FULLADDER5 : full_adder PORT MAP(A => A(3), B => B(3), Cin => '0', S => S3(0), COUT => MUX_INPUT0(0));
    FULLADDER6 : full_adder PORT MAP(A => A(3), B => B(3), Cin => '1', S => S3(1), COUT => MUX_INPUT0(1));
    MUX1 : mux2_1 PORT MAP(A => S3(0), B => S3(1), Sel => C0, Z => S(3));
    --FINAL MUX1
    MUX2 : mux2_1 PORT MAP(A => MUX_INPUT0(0), B => MUX_INPUT0(1), Sel => C0, Z => MUX_OUTPUT0);
    --2
    --24
    FULLADDER7 : full_adder PORT MAP(A => A(4), B => B(4), Cin => '0', S => S4(0));
    FULLADDER8 : full_adder PORT MAP(A => A(4), B => B(4), Cin => '1', S => S4(1));
    MUX3 : mux2_1 PORT MAP(A => S4(0), B => S4(1), Sel => MUX_OUTPUT0, Z => S(4));
    --25
    FULLADDER9 : full_adder PORT MAP(A => A(5), B => B(5), Cin => '0', S => S5(0));
    FULLADDER10 : full_adder PORT MAP(A => A(5), B => B(5), Cin => '1', S => S5(1));
    MUX4 : mux2_1 PORT MAP(A => S5(0), B => S5(1), Sel => MUX_OUTPUT0, Z => S(5));
    --26
    FULLADDER11 : full_adder PORT MAP(A => A(6), B => B(6), Cin => '0', S => S6(0), COUT => MUX_INPUT1(0));
    FULLADDER12 : full_adder PORT MAP(A => A(6), B => B(6), Cin => '1', S => S6(1), COUT => MUX_INPUT1(1));
    MUX5 : mux2_1 PORT MAP(A => S6(0), B => S6(1), Sel => MUX_OUTPUT0, Z => S(6));
    --FINAL MUX2
    MUX6 : mux2_1 PORT MAP(
        A => MUX_INPUT1(0), B => MUX_INPUT1(1), Sel => MUX_OUTPUT0, Z => MUX_OUTPUT1);
    --3
    --37
    FULLADDER13 : full_adder PORT MAP(A => A(7), B => B(7), Cin => '0', S => S7(0));
    FULLADDER14 : full_adder PORT MAP(A => A(7), B => B(7), Cin => '1', S => S7(1));
    MUX7 : mux2_1 PORT MAP(A => S7(0), B => S7(1), Sel => MUX_OUTPUT1, Z => S(7));
    --38
    FULLADDER15 : full_adder PORT MAP(A => A(8), B => B(8), Cin => '0', S => S8(0));
    FULLADDER16 : full_adder PORT MAP(A => A(8), B => B(8), Cin => '1', S => S8(1));
    MUX8 : mux2_1 PORT MAP(A => S8(0), B => S8(1), Sel => MUX_OUTPUT1, Z => S(8));
    --39
    FULLADDER17 : full_adder PORT MAP(A => A(9), B => B(9), Cin => '0', S => S9(0));
    FULLADDER18 : full_adder PORT MAP(A => A(9), B => B(9), Cin => '1', S => S9(1));
    MUX9 : mux2_1 PORT MAP(A => S9(0), B => S9(1), Sel => MUX_OUTPUT1, Z => S(9));
    --310
    FULLADDER19 : full_adder PORT MAP(A => A(10), B => B(10), Cin => '0', S => S10(0), COUT => MUX_INPUT2(0));
    FULLADDER20 : full_adder PORT MAP(A => A(10), B => B(10), Cin => '1', S => S10(1), COUT => MUX_INPUT2(1));
    MUX10 : mux2_1 PORT MAP(A => S10(0), B => S10(1), Sel => MUX_OUTPUT1, Z => S(10));
    --FINAL MUX3
    MUX11 : mux2_1 PORT MAP(A => MUX_INPUT2(0), B => MUX_INPUT2(1), Sel => MUX_OUTPUT1, Z => MUX_OUTPUT2);

    --4
    --411
    FULLADDER21 : full_adder PORT MAP(A => A(11), B => B(11), Cin => '0', S => S11(0));
    FULLADDER22 : full_adder PORT MAP(A => A(11), B => B(11), Cin => '1', S => S11(1));
    MUX12 : mux2_1 PORT MAP(A => S11(0), B => S11(1), Sel => MUX_OUTPUT2, Z => S(11));
    --412
    FULLADDER23 : full_adder PORT MAP(A => A(12), B => B(12), Cin => '0', S => S12(0));
    FULLADDER24 : full_adder PORT MAP(A => A(12), B => B(12), Cin => '1', S => S12(1));
    MUX13 : mux2_1 PORT MAP(A => S12(0), B => S12(1), Sel => MUX_OUTPUT2, Z => S(12));
    --413
    FULLADDER25 : full_adder PORT MAP(A => A(13), B => B(13), Cin => '0', S => S13(0));
    FULLADDER26 : full_adder PORT MAP(A => A(13), B => B(13), Cin => '1', S => S13(1));
    MUX14 : mux2_1 PORT MAP(A => S13(0), B => S13(1), Sel => MUX_OUTPUT2, Z => S(13));
    --414
    FULLADDER27 : full_adder PORT MAP(A => A(14), B => B(14), Cin => '0', S => S14(0));
    FULLADDER28 : full_adder PORT MAP(A => A(14), B => B(14), Cin => '1', S => S14(1));
    MUX15 : mux2_1 PORT MAP(A => S14(0), B => S14(1), Sel => MUX_OUTPUT2, Z => S(14));
    --415
    FULLADDER29 : full_adder PORT MAP(A => A(15), B => B(15), Cin => '0', S => S15(0), COUT => MUX_INPUT3(0));
    FULLADDER30 : full_adder PORT MAP(A => A(15), B => B(15), Cin => '1', S => S15(1), COUT => MUX_INPUT3(1));
    MUX16 : mux2_1 PORT MAP(A => S15(0), B => S15(1), Sel => MUX_OUTPUT2, Z => S(15));
    --FINAL MUX4
    MUX17 : mux2_1 PORT MAP(A => MUX_INPUT3(0), B => MUX_INPUT3(1), Sel => MUX_OUTPUT2, Z => COUT);
END Behavioral;