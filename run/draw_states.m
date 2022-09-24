% Hamiltonians
load Hup.txt
Hup = to_complex(Hup);
load Hdw.txt
Hdw = to_complex(Hdw);
% Eigenvectors
[Vup,Eup] = eig(Hup);
Sup = to_complex(load("km_up_states.txt"));
Lup = load("km_up_levels.txt");
Eup = sort(real(diag(Eup)));
[Vdw,Edw] = eig(Hdw);
Sdw = to_complex(load("km_dw_states.txt"));
Ldw = load("km_dw_levels.txt");
Edw = sort(real(diag(Edw)));
% Probabilities
Pup = Sup .* conj(Sup);
Pdw = Sdw .* conj(Sdw);
% Ground State
Gup = Pup(:,1)*5000;
Gdw = Pdw(:,1)*5000;
% Edge States
nF = floor(size(Pup,1)/2);
S1up = Pup(:,nF)*5000;
S1dw = Pdw(:,nF)*5000;
S2up = Pup(:,nF+1)*5000;
S2dw = Pdw(:,nF+1)*5000;
% Lattice
load flake.txt
% Plot it
figure("Name","groundstate")
scatter(flake(:,1),flake(:,2),1,'k','filled')
hold on; axis equal
scatter(flake(:,1),flake(:,2),Gup,'filled','MarkerFaceColor','b','MarkerFaceAlpha',0.5)
scatter(flake(:,1),flake(:,2),Gdw,'filled','MarkerFaceColor','r','MarkerFaceAlpha',0.5)
figure("Name","edgestate 1")
scatter(flake(:,1),flake(:,2),1,'k','filled')
hold on; axis equal
scatter(flake(:,1),flake(:,2),S1up,'filled','MarkerFaceColor','b','MarkerFaceAlpha',0.5)
scatter(flake(:,1),flake(:,2),S1dw,'filled','MarkerFaceColor','r','MarkerFaceAlpha',0.5)
figure("Name","edgestate 2")
scatter(flake(:,1),flake(:,2),1,'k','filled')
hold on; axis equal
scatter(flake(:,1),flake(:,2),S2up,'filled','MarkerFaceColor','b','MarkerFaceAlpha',0.5)
scatter(flake(:,1),flake(:,2),S2dw,'filled','MarkerFaceColor','r','MarkerFaceAlpha',0.5)

function H = to_complex(fort)
   N = min(size(fort));
   H = fort(1:N,:);
   H = H + 1i*fort(N+1,:,:);
end