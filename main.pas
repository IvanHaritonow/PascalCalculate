program beginner;
uses crt;

function isntNumber(a: String; b: String): Integer;
var i, ch1, ch2: Integer;
begin
  for i := 1 to a.Length do begin
    if (a[i] <> '1') and (a[i] <> '2') and 
    (a[i] <> '3') and (a[i] <> '5') and
    (a[i] <> '4') and (a[i] <> '7') and
    (a[i] <> '6') and (a[i] <> '9') and
    (a[i] <> '8') and (a[i] <> '0') then
    begin
      ch1 := 1;
      break;
    end;  
  end;
  for i := 1 to b.Length do begin
    if (b[i] <> '1') and (b[i] <> '2') and 
    (b[i] <> '3') and (b[i] <> '5') and
    (b[i] <> '4') and (b[i] <> '7') and
    (b[i] <> '6') and (b[i] <> '9') and
    (b[i] <> '8') and (b[i] <> '0') then
    begin
      ch2 := 1;
      break;
    end;  
  end;
  if (ch1 = 1) or (ch2 = 1) then 
    isntNumber := 1;
end;

function resultIs(a: Integer; b: Integer; oprt: char): Real;
var res: Real;
begin
  if(oprt = '+') then
    res := a + b;
  if(oprt = '-') then
    res := a - b;
  if(oprt = '/') then
    res := a / b;
  if(oprt = '*') then
    res := a * b;  
  resultIs := res;  
end;

function calculate(): Integer;
var str, aOrt, bOrt, strClone: String;
a, b, i, oprtPos, check: Integer;
res: real;
oprt: char;
begin
  check := 0;
  readln(str);
  for i := 1 to str.Length do
    str[i] := UpCase(str[i]);
//  if(str = 'EXIT') then 
//    exit();
  if (str.Length > 21) then begin
    writeln('Error #5');
    calculate();
  end;
  if (str.Length < 3) then begin
    writeln('Error #2');
    calculate();
  end;
  if(str = 'CLEAR') then begin
      clrscr();
      calculate();
  end;
  
  if (str[1] = '-') then begin
    check := 1;
    for i := 2 to str.Length do begin
      strClone := strClone + str [i];
    end;
    str := strClone;
  end;
  
  for i := 1 to str.Length do begin
    if (str[i] = '+') then begin 
      oprt := '+';
      oprtPos := i;
      break;
    end else 
    if (str[i] = '-') then begin 
      oprt := '-';
      oprtPos := i;
      break;
    end else 
    if (str[i] = '/') then begin 
      oprt := '/';
      oprtPos := i;
      break;
    end else 
    if (str[i] = '*') then begin 
      oprt := '*';
      oprtPos := i;
      break;
    end else begin
      if (i = str.Length) then begin
        writeln('Error #1');
        delay(1000);
        calculate();
      end;
    end;
  end;
  
  aOrt := '';
  bOrt := '';
  
  for i := 1 to oprtPos - 1 do begin
    aOrt := aOrt + str[i];
  end;
  
  for i := oprtPos + 1 to str.Length do begin
    bOrt := bOrt + str[i];
  end;
  
  if(isntNumber(aOrt, bOrt) = 1) then begin
    writeln('Error #4');
    calculate();
  end;
  
  if (aOrt.Length > 9) then begin
    writeln('Error #6');
    calculate();
  end;
  if (bOrt.Length > 9) then begin
    writeln('Error #7');
    calculate();
  end;
  
  a := StrToInt(aOrt);
  if (bOrt = '') then begin
    writeln('Error #3');
    calculate();
  end;
  b := StrToInt(bOrt);
  
  if (check = 1) then 
    a := a * (-1);
  
  res := resultIs(a, b, oprt);
  
  writeln('= ', res);
  writeln();
  calculate();
end;

begin
  writeln('clear - очистить');
  writeln('<число> <операция + - / :> <число>');
  writeln('Например: 56/3');
  calculate();
end.
