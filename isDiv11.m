function TF  = isDiv11(num)
    if numel(num) > 1
        error('input must be scalar')
    end
    if num < 0 
        error('input must be positive')
    end
    if isequal(fix(num),num) == 0
        error('input must be integer')
    end

    if num >= 1*(10^15)
        error('input can not be larger than 1*10^15')
    end
    sum = 0;
    sign = 1;
    numS = num2str(num);

    for i = 1 : length(numS);

       digit = str2num(numS(i));
       sum = sum + (digit * sign);
       sign = sign * -1;


    end

    if sum < 0
        sum = sum * -1;
    end

    sumS = num2str(sum);
    TF = 1;
    first_char = sumS(1);
    for i = 2 : length(sumS)
        if ~strcmp(first_char, sumS(i))

            TF = 0;
        end
    end


    if length(sumS) == 1 && sum ~= 0

        TF = 0;

    end

    if sum == 0

        TF = 1;
    end

    end 