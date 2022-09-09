function [Eq] = ErroQuadratico(X, Sd, Id, Rd)
% Esta função determina o erro quadrático
% entre a saída real e a saída do modelo.
% u - entrada real - Laboratório
% y - saída real - Laboratório
% t - tempo real - Laboratório
% X = [Km pm] - o que eu quero descobrir
% desejo estimar [ Km e pm ] que minimiza o Eq (erro)

r = X(1);
beta = X(2);

%%% Modelo

% G = tf(Km,[1 pm]);      % função de transferência estimada para o Motor

%%% Saida do modelo
R0 = 0;
S0 = 499;
I0 = 1;
model = sim("ModeloSIR.slx");
SdValues = model.logsout{1}.Values.Data;
IdValues = model.logsout{2}.Values.Data;
RdValues = model.logsout{3}.Values.Data;

% ym = lsim(G,u,t);        % y teorico

%%% Erro quadrático - comparar com os dados experimentais

Eq1 = sum((Sd - SdValues).^2);
Eq2 = sum((Id - IdValues).^2);
Eq3 = sum((Rd - RdValues).^2);

Eq = sum(Eq1 + Eq2 + Eq3);   % cálculo do erro

end

