function obj = mpl_learner(gradient, verbose)
%MPL_LEARNER  Creates a new maximum pseudo-likelihood learning object.
%
%   MPL_LEARNER(gradient, verbose) creates and returns a new maximum
%   pseudo-likelihood learning object. Set 'gradient' to true to force the
%   implementation to compute the gradient in combination with the
%   likelihood. 'verbose' can be used to turn information on or off.
%
%   See also MPL_LEARNER/INVOKE, BASE_LEARNER.

    if (islogical(gradient) == false)
        error('mpl_learner: ''gradient'' must be a logical');
    end
    
    if (islogical(verbose) == false)
        error('mpl_learner: ''verbose'' must be a logical');
    end
    
    if (gradient == false)
        GradObj = 'off';
    else
        GradObj = 'on';
    end
    
    if (verbose == false)
        Diagnostics = 'off';
        Display     = 'off';
    else
        Diagnostics = 'on';
        Display     = 'iter';
    end
    
    obj.verbose = verbose;
    
    % TODO: Are these appropriate values? Should more be configurable?
    obj.options = optimset('LargeScale',  'off', ...        % kuai
                           'MaxIter',     500, ...
                          'Diagnostics', Diagnostics, ...
                          'GradObj',     GradObj, ...
                          'Display',     Display, ...
                          'TolFun',      1e-8, ...
                          'MaxFunEvals', 5000);
%     obj.options = optimset('MaxIter',     500, ...
%                            'Diagnostics', Diagnostics, ...
%                            'GradObj',     GradObj, ...
%                            'Display',     Display, ...
%                            'TolFun',      1e-8, ...
%                            'MaxFunEvals', 5000);
%     
    obj.state = [];
    obj.weights = [];
    obj.sigma_2 = [];
    obj.param_indices = [];
    
    obj.base_learner='mpl_learner';
