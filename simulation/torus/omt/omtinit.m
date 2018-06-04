function v = omtinit

prov= [
    -0.3778    0.1898
    0.8468   -0.4756
    -0.1396    0.2057
    -0.6304    0.4224
    0.8098   -0.5565
    0.9595   -0.7652
    -0.1223   -0.4066
    -0.7778   -0.3624
    -0.4839   -0.1517
    -0.1826    0.0157];

prov = prov*1/3;


v = [];
for i = -1:1
    for j = -1:1
        tmpv = [];
        
        tmpv = prov;
        
        tmpv(:,1) = tmpv(:,1) + i*2/3;
        tmpv(:,2) = tmpv(:,2) + j*2/3;
        
        v = [v;tmpv];
        
    end
end


tmpv = [];

tmpv = rand(90,2)*0.000001;

v = v +tmpv;

end
