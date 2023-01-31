LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY mux2_1 IS
    PORT (

        A, B : IN STD_LOGIC;
        Sel : IN STD_LOGIC;
        Z : OUT STD_LOGIC
    );
END mux2_1;

ARCHITECTURE bhv OF mux2_1 IS
BEGIN
    PROCESS (A, B, Sel)
    BEGIN
        IF Sel = '0' THEN
            Z <= A;
        ELSE
            Z <= B;
        END IF;
    END PROCESS;
END bhv;