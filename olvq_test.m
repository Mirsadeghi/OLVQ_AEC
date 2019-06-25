function output = olvq_test(input,n,code_book_landa,code_book,target,landa)
    for j = 1:size(code_book_landa,2)
        dis_landa(j) = sum(landa(1:size(code_book_landa,1)-1,j) .* (input - code_book_landa(1:size(code_book_landa,1)-size(target,1),j)).^2);
    end
    for j = 1:size(code_book,2)
        dis(j) = sum(input - code_book(1:size(code_book,1)-size(target,1),j)).^2;
    end

    [~, idx_landa] = min(dis_landa);
    [~, idx] = min(dis);
    output = [idx_landa target(:,n);
              idx       target(:,n)];
end
