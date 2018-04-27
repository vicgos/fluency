%Calculating Spectral Arc Length for all strokes in a trial and plotting the results

function ssal = segmentedSAL(strokescell)

ssal = zeros(numel(strokescell),1);

for ind=1:numel(strokescell)                                        
    
ssal(ind) = SpectralArcLength(strokescell{ind}, 0.005);

end

plot(ssal,'k')
set(gca,'FontSize',18);
xlabel('Stroke number','FontSize', 24)
ylabel('Spectral Arc Length (sal)','FontSize', 24)
grid
