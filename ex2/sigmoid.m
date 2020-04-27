function g = sigmoid(z)

g = zeros(size(z));





g = 1./(1+exp(-z));

% 
% a1 = size(z);
% 
% if sum(a1) == 2
%     g = 1 / (1+exp(-z));
% elseif sum(a1) > 2
%     for i1 = 1:a1(1)
%         for i2 = 1:a1(2)
%             a2 = z(i1,i2);
%             f = 1 / (1+exp(-a2));
%             g(i1, i2) = f;
%         end
%     end
    
    
    
end
