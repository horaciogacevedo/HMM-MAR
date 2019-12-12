function options = checkspelling (options)

  potential_options = {
    'K';...
    'onpower';...
    'leida';...
    'order';...
    'maxorder';...
    'covtype';...
    'zeromean';...
    'embeddedlags';...
    'pca';...
    'pca_spatial';...
    'lowrank';...
    'varimax';...
    'maxFOth'; ...
    'pcamar';...
    'pcapred';...
    'standardise';...
    'standardise_pc';...
    'crosstermsonly';...
    'filter';...
    'detrend';...
    'downsample';...
    'leakagecorr';...
    'sequential';...
    'A';...
    'As';...
    'B';...
    'V';...
    'ndim';...
    'vcomp';...
    'timelag';...
    'exptimelag';...
    'orderoffset';...
    'symmetricprior';...
    'grouping';...
    'priorcov_rate';...
    'AR';...
    'uniqueAR';...
    'id_mixture';...
    'cluster';...
    'Pstructure';...
    'Pistructure';...
    'plotAverageGamma';...
    'tuda';...
    'tudamonitoring';...
    'behaviour';...
    'S';...
    'Sind';...
    'prior';...
    'initial_hmm';...
    'state';...
    'Fs';...
    'cyc';...
    'tol';...
    'meancycstop';...
    'cycstogoafterevent';...
    'DirStats';...
    'initTestSmallerK';...
    'initcyc';...
    'initrep';...
    'inittype';...
    'initcriterion';...
    'Gamma';...
    'hmm';...
    'fehist';...
    'DirichletDiag';...
    'dropstates';...
    'repetitions';...
    'updateObs';...
    'updateGamma';...
    'updateP';...
    'decodeGamma';...
    'keepS_W';...
    'useParallel';...
    'useMEX';...
    'verbose';...
    'cvfolds';...
    'cvrep';...
    'cvmode';...
    'cvverbose';...
    'BIGNbatch';... % STOCHASTIC
    'BIGNinitbatch';...
    'BIGprior';...
    'BIGcyc';...
    'BIGmincyc';...
    'BIGundertol_tostop';...
    'BIGcycnobetter_tostop';...
    'BIGtol';...
    'BIGinitrep';...
    'BIGdecodeGamma';...
    'BIGforgetrate';...
    'BIGdelay';...
    'BIGbase_weights';...
    'BIGcomputeGamma';...
    'BIGverbose';...
    'p';...
    'removezeros';...
    'completelags';...
    'rlowess';...
    'numIterations';...
    'tol';...
    'pad';... % SPECTRA
    'Fs';...
    'fpass';...
    'tapers';...
    'win';...
    'to_do';...
    'loadings';...
    'Nf';...
    'MLestimation';...
    'level';...
    'PriorWeightingP';...
    'PriorWeightingPi';...
    'distribution';...
    'logisticYdim';...
    'balancedata';...
  };

  current_options = fieldnames(options);
  unrecognized = current_options(~ismember(current_options,potential_options));

  for j = 1:length(unrecognized)
    % Check edit distance
    distances = cellfun(@(x) EditDistance(unrecognized{j},x),potential_options);
    [d,idx] = min(distances);
    if d <= 2 % Be selective, it will only suggest something based on a minor typo
      fprintf(2,sprintf('%s is not a recognized option - did you mean ''%s''?\n',unrecognized{j},potential_options{idx}));
    else
      fprintf(2,sprintf('%s is not a recognized option\n',unrecognized{j}))
    end

    options = rmfield(options,unrecognized{j});
  end

end


function [V,v] = EditDistance(string1,string2)
  % Edit Distance is a standard Dynamic Programming problem. Given two strings s1 and s2, 
  % the edit distance between s1 and s2 is the minimum number of operations required to convert string 
  % FROM FILE EXCHANGE
  % by : Reza Ahmadzadeh (seyedreza_ahmadzadeh@yahoo.com - reza.ahmadzadeh@iit.it)
  % 14-11-2012

  m=length(string1);
  n=length(string2);
  v=zeros(m+1,n+1);
  for i=1:1:m
      v(i+1,1)=i;
  end
  for j=1:1:n
      v(1,j+1)=j;
  end
  for i=1:m
      for j=1:n
          if (string1(i) == string2(j))
              v(i+1,j+1)=v(i,j);
          else
              v(i+1,j+1)=1+min(min(v(i+1,j),v(i,j+1)),v(i,j));
          end
      end
  end
  V=v(m+1,n+1);
end

