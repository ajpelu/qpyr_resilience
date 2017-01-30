-   [Resilience](#resilience)
    -   [Mean values (Cluster population)](#mean-values-cluster-population)
    -   [Summer](#summer)
        -   [Summary ANOVA model](#summary-anova-model)
        -   [Effects plot](#effects-plot)
        -   [Post-hoc comparison](#post-hoc-comparison)
    -   [Spring](#spring)
        -   [Summary ANOVA model](#summary-anova-model-1)
        -   [Effects plot](#effects-plot-1)
        -   [Post-hoc comparison](#post-hoc-comparison-1)
    -   [Annual](#annual)
        -   [Summary ANOVA model](#summary-anova-model-2)
        -   [Effects plot](#effects-plot-2)
        -   [Post-hoc comparison](#post-hoc-comparison-2)

Resilience
==========

Mean values (Cluster population)
--------------------------------

<table style="width:99%;">
<caption>Mean values (rs)</caption>
<colgroup>
<col width="13%" />
<col width="13%" />
<col width="15%" />
<col width="16%" />
<col width="15%" />
<col width="11%" />
<col width="12%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">clu_pop</th>
<th align="center">mean</th>
<th align="center">sd</th>
<th align="center">se</th>
<th align="center">variable</th>
<th align="center">event</th>
<th align="center">seasonF</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">N</td>
<td align="center">0.9391200</td>
<td align="center">0.05105309</td>
<td align="center">0.001703664</td>
<td align="center">rs</td>
<td align="center">2005</td>
<td align="center">annual</td>
</tr>
<tr class="even">
<td align="center">S</td>
<td align="center">0.9357996</td>
<td align="center">0.05235562</td>
<td align="center">0.001729879</td>
<td align="center">rs</td>
<td align="center">2005</td>
<td align="center">annual</td>
</tr>
<tr class="odd">
<td align="center">N</td>
<td align="center">1.0025355</td>
<td align="center">0.04849661</td>
<td align="center">0.001618353</td>
<td align="center">rs</td>
<td align="center">2012</td>
<td align="center">annual</td>
</tr>
<tr class="even">
<td align="center">S</td>
<td align="center">0.9996486</td>
<td align="center">0.04983377</td>
<td align="center">0.001646554</td>
<td align="center">rs</td>
<td align="center">2012</td>
<td align="center">annual</td>
</tr>
<tr class="odd">
<td align="center">N</td>
<td align="center">0.9410772</td>
<td align="center">0.05756861</td>
<td align="center">0.001921089</td>
<td align="center">rs</td>
<td align="center">2005</td>
<td align="center">spring</td>
</tr>
<tr class="even">
<td align="center">S</td>
<td align="center">0.9477028</td>
<td align="center">0.06257670</td>
<td align="center">0.002067593</td>
<td align="center">rs</td>
<td align="center">2005</td>
<td align="center">spring</td>
</tr>
<tr class="odd">
<td align="center">N</td>
<td align="center">1.0151042</td>
<td align="center">0.05766974</td>
<td align="center">0.001924464</td>
<td align="center">rs</td>
<td align="center">2012</td>
<td align="center">spring</td>
</tr>
<tr class="even">
<td align="center">S</td>
<td align="center">1.0253790</td>
<td align="center">0.06215434</td>
<td align="center">0.002053637</td>
<td align="center">rs</td>
<td align="center">2012</td>
<td align="center">spring</td>
</tr>
<tr class="odd">
<td align="center">N</td>
<td align="center">0.9271526</td>
<td align="center">0.05488102</td>
<td align="center">0.001831403</td>
<td align="center">rs</td>
<td align="center">2005</td>
<td align="center">summer</td>
</tr>
<tr class="even">
<td align="center">S</td>
<td align="center">0.9094511</td>
<td align="center">0.05774945</td>
<td align="center">0.001908096</td>
<td align="center">rs</td>
<td align="center">2005</td>
<td align="center">summer</td>
</tr>
<tr class="odd">
<td align="center">N</td>
<td align="center">1.0196845</td>
<td align="center">0.06014536</td>
<td align="center">0.002007077</td>
<td align="center">rs</td>
<td align="center">2012</td>
<td align="center">summer</td>
</tr>
<tr class="even">
<td align="center">S</td>
<td align="center">0.9826980</td>
<td align="center">0.04923157</td>
<td align="center">0.001626657</td>
<td align="center">rs</td>
<td align="center">2012</td>
<td align="center">summer</td>
</tr>
</tbody>
</table>

Summer
------

### Summary ANOVA model

<table style="width:79%;">
<caption>ANOVA table: rs summer</caption>
<colgroup>
<col width="19%" />
<col width="6%" />
<col width="11%" />
<col width="12%" />
<col width="16%" />
<col width="12%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">term</th>
<th align="center">df</th>
<th align="center">sumsq</th>
<th align="center">meansq</th>
<th align="center">statistic</th>
<th align="center">p.value</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">event</td>
<td align="center">1</td>
<td align="center">6.217</td>
<td align="center">6.217</td>
<td align="center">2009</td>
<td align="center"><strong>0</strong></td>
</tr>
<tr class="even">
<td align="center">clu_pop</td>
<td align="center">1</td>
<td align="center">0.6781</td>
<td align="center">0.6781</td>
<td align="center">219.1</td>
<td align="center"><strong>0</strong></td>
</tr>
<tr class="odd">
<td align="center">event:clu_pop</td>
<td align="center">1</td>
<td align="center">0.08432</td>
<td align="center">0.08432</td>
<td align="center">27.25</td>
<td align="center"><strong>0</strong></td>
</tr>
<tr class="even">
<td align="center">Residuals</td>
<td align="center">3624</td>
<td align="center">11.22</td>
<td align="center">0.00309</td>
<td align="center"></td>
<td align="center"></td>
</tr>
</tbody>
</table>

<table style="width:49%;">
<colgroup>
<col width="33%" />
<col width="15%" />
</colgroup>
<thead>
<tr class="header">
<th align="center"> </th>
<th align="center">Statistic</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center"><strong><span class="math inline"><em>R</em><sup>2</sup></span></strong></td>
<td align="center">0.38</td>
</tr>
<tr class="even">
<td align="center"><strong><span class="math inline"><em>a</em><em>d</em><em>j</em><em>R</em><sup>2</sup></span></strong></td>
<td align="center">0.38</td>
</tr>
<tr class="odd">
<td align="center"><strong><span class="math inline"><em>σ</em><sub><em>e</em></sub></span></strong></td>
<td align="center">0.06</td>
</tr>
<tr class="even">
<td align="center"><strong><span class="math inline"><em>F</em></span></strong></td>
<td align="center">751.75</td>
</tr>
<tr class="odd">
<td align="center"><strong><span class="math inline"><em>p</em></span></strong></td>
<td align="center">0.00</td>
</tr>
<tr class="even">
<td align="center"><strong><span class="math inline"><em>d</em><em>f</em><sub><em>m</em></sub></span></strong></td>
<td align="center">4.00</td>
</tr>
<tr class="odd">
<td align="center"><strong><span class="math inline"><em>l</em><em>o</em><em>g</em><em>L</em><em>i</em><em>k</em></span></strong></td>
<td align="center">5335.40</td>
</tr>
<tr class="even">
<td align="center"><strong><span class="math inline"><em>A</em><em>I</em><em>C</em></span></strong></td>
<td align="center">-10660.80</td>
</tr>
<tr class="odd">
<td align="center"><strong><span class="math inline"><em>B</em><em>I</em><em>C</em></span></strong></td>
<td align="center">-10629.82</td>
</tr>
<tr class="even">
<td align="center"><strong><span class="math inline"><em>d</em><em>e</em><em>v</em></span></strong></td>
<td align="center">11.22</td>
</tr>
<tr class="odd">
<td align="center"><strong><span class="math inline"><em>d</em><em>f</em><sub><em>e</em></sub></span></strong></td>
<td align="center">3624.00</td>
</tr>
</tbody>
</table>

### Effects plot

#### . ~ Cluster population

<img src="analysis_resilience_two_events_files/figure-markdown_github/unnamed-chunk-9-1.png" style="display: block; margin: auto;" />

#### . ~ Disturbance Event

<img src="analysis_resilience_two_events_files/figure-markdown_github/unnamed-chunk-10-1.png" style="display: block; margin: auto;" />

##### . ~ Cluster population:Elevation

<img src="analysis_resilience_two_events_files/figure-markdown_github/unnamed-chunk-11-1.png" style="display: block; margin: auto;" />

### Post-hoc comparison

    ## 
    ## ### Event ###
    ## $lsmeans
    ##  event    lsmean          SE   df  lower.CL  upper.CL
    ##  2005  0.9183018 0.001306243 3624 0.9157408 0.9208629
    ##  2012  1.0011913 0.001306243 3624 0.9986302 1.0037523
    ## 
    ## Results are averaged over the levels of: clu_pop 
    ## Confidence level used: 0.95 
    ## 
    ## $contrasts
    ##  contrast       estimate          SE   df t.ratio p.value
    ##  2005 - 2012 -0.08288943 0.001847307 3624  -44.87  <.0001
    ## 
    ## Results are averaged over the levels of: clu_pop 
    ## 
    ##  event    lsmean          SE   df  lower.CL  upper.CL .group
    ##  2005  0.9183018 0.001306243 3624 0.9153792 0.9212244  a    
    ##  2012  1.0011913 0.001306243 3624 0.9982687 1.0041139   b   
    ## 
    ## Results are averaged over the levels of: clu_pop 
    ## Confidence level used: 0.95 
    ## Conf-level adjustment: sidak method for 2 estimates 
    ## significance level used: alpha = 0.01 
    ## 
    ## ### Clu pop ###
    ## $lsmeans
    ##  clu_pop    lsmean          SE   df  lower.CL  upper.CL
    ##  N       0.9734185 0.001312708 3624 0.9708448 0.9759923
    ##  S       0.9460745 0.001299746 3624 0.9435262 0.9486228
    ## 
    ## Results are averaged over the levels of: event 
    ## Confidence level used: 0.95 
    ## 
    ## $contrasts
    ##  contrast   estimate          SE   df t.ratio p.value
    ##  N - S    0.02734401 0.001847307 3624  14.802  <.0001
    ## 
    ## Results are averaged over the levels of: event 
    ## 
    ##  clu_pop    lsmean          SE   df  lower.CL  upper.CL .group
    ##  S       0.9460745 0.001299746 3624 0.9431665 0.9489826  a    
    ##  N       0.9734185 0.001312708 3624 0.9704815 0.9763556   b   
    ## 
    ## Results are averaged over the levels of: event 
    ## Confidence level used: 0.95 
    ## Conf-level adjustment: sidak method for 2 estimates 
    ## significance level used: alpha = 0.01 
    ## 
    ## ### Event:Clu pop ###
    ## $lsmeans
    ##  event clu_pop    lsmean          SE   df  lower.CL  upper.CL
    ##  2005  N       0.9271526 0.001856450 3624 0.9235128 0.9307923
    ##  2012  N       1.0196845 0.001856450 3624 1.0160447 1.0233243
    ##  2005  S       0.9094511 0.001838119 3624 0.9058472 0.9130549
    ##  2012  S       0.9826980 0.001838119 3624 0.9790941 0.9863018
    ## 
    ## Confidence level used: 0.95 
    ## 
    ## $contrasts
    ##  contrast           estimate          SE   df t.ratio p.value
    ##  2005,N - 2012,N -0.09253197 0.002625416 3624 -35.245  <.0001
    ##  2005,N - 2005,S  0.01770146 0.002612487 3624   6.776  <.0001
    ##  2005,N - 2012,S -0.05554543 0.002612487 3624 -21.262  <.0001
    ##  2012,N - 2005,S  0.11023344 0.002612487 3624  42.195  <.0001
    ##  2012,N - 2012,S  0.03698655 0.002612487 3624  14.158  <.0001
    ##  2005,S - 2012,S -0.07324689 0.002599493 3624 -28.177  <.0001
    ## 
    ## P value adjustment: tukey method for comparing a family of 4 estimates

Spring
------

### Summary ANOVA model

<table style="width:79%;">
<caption>ANOVA table: rs spring</caption>
<colgroup>
<col width="19%" />
<col width="6%" />
<col width="11%" />
<col width="12%" />
<col width="16%" />
<col width="12%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">term</th>
<th align="center">df</th>
<th align="center">sumsq</th>
<th align="center">meansq</th>
<th align="center">statistic</th>
<th align="center">p.value</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">event</td>
<td align="center">1</td>
<td align="center">5.221</td>
<td align="center">5.221</td>
<td align="center">1447</td>
<td align="center"><strong>0</strong></td>
</tr>
<tr class="even">
<td align="center">clu_pop</td>
<td align="center">1</td>
<td align="center">0.06476</td>
<td align="center">0.06476</td>
<td align="center">17.95</td>
<td align="center"><strong>2e-05</strong></td>
</tr>
<tr class="odd">
<td align="center">event:clu_pop</td>
<td align="center">1</td>
<td align="center">0.00302</td>
<td align="center">0.00302</td>
<td align="center">0.8369</td>
<td align="center">0.3603</td>
</tr>
<tr class="even">
<td align="center">Residuals</td>
<td align="center">3624</td>
<td align="center">13.07</td>
<td align="center">0.00361</td>
<td align="center"></td>
<td align="center"></td>
</tr>
</tbody>
</table>

<table style="width:49%;">
<colgroup>
<col width="33%" />
<col width="15%" />
</colgroup>
<thead>
<tr class="header">
<th align="center"> </th>
<th align="center">Statistic</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center"><strong><span class="math inline"><em>R</em><sup>2</sup></span></strong></td>
<td align="center">0.29</td>
</tr>
<tr class="even">
<td align="center"><strong><span class="math inline"><em>a</em><em>d</em><em>j</em><em>R</em><sup>2</sup></span></strong></td>
<td align="center">0.29</td>
</tr>
<tr class="odd">
<td align="center"><strong><span class="math inline"><em>σ</em><sub><em>e</em></sub></span></strong></td>
<td align="center">0.06</td>
</tr>
<tr class="even">
<td align="center"><strong><span class="math inline"><em>F</em></span></strong></td>
<td align="center">488.66</td>
</tr>
<tr class="odd">
<td align="center"><strong><span class="math inline"><em>p</em></span></strong></td>
<td align="center">0.00</td>
</tr>
<tr class="even">
<td align="center"><strong><span class="math inline"><em>d</em><em>f</em><sub><em>m</em></sub></span></strong></td>
<td align="center">4.00</td>
</tr>
<tr class="odd">
<td align="center"><strong><span class="math inline"><em>l</em><em>o</em><em>g</em><em>L</em><em>i</em><em>k</em></span></strong></td>
<td align="center">5057.34</td>
</tr>
<tr class="even">
<td align="center"><strong><span class="math inline"><em>A</em><em>I</em><em>C</em></span></strong></td>
<td align="center">-10104.68</td>
</tr>
<tr class="odd">
<td align="center"><strong><span class="math inline"><em>B</em><em>I</em><em>C</em></span></strong></td>
<td align="center">-10073.69</td>
</tr>
<tr class="even">
<td align="center"><strong><span class="math inline"><em>d</em><em>e</em><em>v</em></span></strong></td>
<td align="center">13.07</td>
</tr>
<tr class="odd">
<td align="center"><strong><span class="math inline"><em>d</em><em>f</em><sub><em>e</em></sub></span></strong></td>
<td align="center">3624.00</td>
</tr>
</tbody>
</table>

### Effects plot

#### . ~ Cluster population

<img src="analysis_resilience_two_events_files/figure-markdown_github/unnamed-chunk-16-1.png" style="display: block; margin: auto;" />

#### . ~ Disturbance Event

<img src="analysis_resilience_two_events_files/figure-markdown_github/unnamed-chunk-17-1.png" style="display: block; margin: auto;" />

#### . ~ Cluster population:Elevation

<img src="analysis_resilience_two_events_files/figure-markdown_github/unnamed-chunk-18-1.png" style="display: block; margin: auto;" />

### Post-hoc comparison

    ## 
    ## ### Event ###
    ## $lsmeans
    ##  event   lsmean          SE   df  lower.CL upper.CL
    ##  2005  0.944390 0.001410295 3624 0.9416249 0.947155
    ##  2012  1.020242 0.001410295 3624 1.0174765 1.023007
    ## 
    ## Results are averaged over the levels of: clu_pop 
    ## Confidence level used: 0.95 
    ## 
    ## $contrasts
    ##  contrast       estimate          SE   df t.ratio p.value
    ##  2005 - 2012 -0.07585161 0.001994458 3624 -38.031  <.0001
    ## 
    ## Results are averaged over the levels of: clu_pop 
    ## 
    ##  event   lsmean          SE   df  lower.CL  upper.CL .group
    ##  2005  0.944390 0.001410295 3624 0.9412346 0.9475454  a    
    ##  2012  1.020242 0.001410295 3624 1.0170862 1.0233970   b   
    ## 
    ## Results are averaged over the levels of: clu_pop 
    ## Confidence level used: 0.95 
    ## Conf-level adjustment: sidak method for 2 estimates 
    ## significance level used: alpha = 0.01 
    ## 
    ## ### Clu pop ###
    ## $lsmeans
    ##  clu_pop    lsmean          SE   df  lower.CL  upper.CL
    ##  N       0.9780907 0.001417275 3624 0.9753119 0.9808694
    ##  S       0.9865409 0.001403280 3624 0.9837896 0.9892922
    ## 
    ## Results are averaged over the levels of: event 
    ## Confidence level used: 0.95 
    ## 
    ## $contrasts
    ##  contrast     estimate          SE   df t.ratio p.value
    ##  N - S    -0.008450257 0.001994458 3624  -4.237  <.0001
    ## 
    ## Results are averaged over the levels of: event 
    ## 
    ##  clu_pop    lsmean          SE   df  lower.CL  upper.CL .group
    ##  N       0.9780907 0.001417275 3624 0.9749196 0.9812617  a    
    ##  S       0.9865409 0.001403280 3624 0.9834012 0.9896806   b   
    ## 
    ## Results are averaged over the levels of: event 
    ## Confidence level used: 0.95 
    ## Conf-level adjustment: sidak method for 2 estimates 
    ## significance level used: alpha = 0.01 
    ## 
    ## ### Event:Clu pop ###
    ## $lsmeans
    ##  event clu_pop    lsmean          SE   df  lower.CL  upper.CL
    ##  2005  N       0.9410772 0.002004329 3624 0.9371474 0.9450069
    ##  2012  N       1.0151042 0.002004329 3624 1.0111744 1.0190339
    ##  2005  S       0.9477028 0.001984538 3624 0.9438119 0.9515937
    ##  2012  S       1.0253790 0.001984538 3624 1.0214881 1.0292700
    ## 
    ## Confidence level used: 0.95 
    ## 
    ## $contrasts
    ##  contrast            estimate          SE   df t.ratio p.value
    ##  2005,N - 2012,N -0.074026985 0.002834549 3624 -26.116  <.0001
    ##  2005,N - 2005,S -0.006625633 0.002820590 3624  -2.349  0.0874
    ##  2005,N - 2012,S -0.084301867 0.002820590 3624 -29.888  <.0001
    ##  2012,N - 2005,S  0.067401352 0.002820590 3624  23.896  <.0001
    ##  2012,N - 2012,S -0.010274882 0.002820590 3624  -3.643  0.0016
    ##  2005,S - 2012,S -0.077676234 0.002806561 3624 -27.677  <.0001
    ## 
    ## P value adjustment: tukey method for comparing a family of 4 estimates

Annual
------

### Summary ANOVA model

<table style="width:83%;">
<caption>ANOVA table: rs annual</caption>
<colgroup>
<col width="19%" />
<col width="6%" />
<col width="11%" />
<col width="12%" />
<col width="16%" />
<col width="16%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">term</th>
<th align="center">df</th>
<th align="center">sumsq</th>
<th align="center">meansq</th>
<th align="center">statistic</th>
<th align="center">p.value</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">event</td>
<td align="center">1</td>
<td align="center">3.673</td>
<td align="center">3.673</td>
<td align="center">1442</td>
<td align="center"><strong>0</strong></td>
</tr>
<tr class="even">
<td align="center">clu_pop</td>
<td align="center">1</td>
<td align="center">0.00874</td>
<td align="center">0.00874</td>
<td align="center">3.431</td>
<td align="center"><strong>0.06407</strong></td>
</tr>
<tr class="odd">
<td align="center">event:clu_pop</td>
<td align="center">1</td>
<td align="center">4e-05</td>
<td align="center">4e-05</td>
<td align="center">0.01673</td>
<td align="center">0.8971</td>
</tr>
<tr class="even">
<td align="center">Residuals</td>
<td align="center">3624</td>
<td align="center">9.228</td>
<td align="center">0.00255</td>
<td align="center"></td>
<td align="center"></td>
</tr>
</tbody>
</table>

<table style="width:49%;">
<colgroup>
<col width="33%" />
<col width="15%" />
</colgroup>
<thead>
<tr class="header">
<th align="center"> </th>
<th align="center">Statistic</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center"><strong><span class="math inline"><em>R</em><sup>2</sup></span></strong></td>
<td align="center">0.29</td>
</tr>
<tr class="even">
<td align="center"><strong><span class="math inline"><em>a</em><em>d</em><em>j</em><em>R</em><sup>2</sup></span></strong></td>
<td align="center">0.28</td>
</tr>
<tr class="odd">
<td align="center"><strong><span class="math inline"><em>σ</em><sub><em>e</em></sub></span></strong></td>
<td align="center">0.05</td>
</tr>
<tr class="even">
<td align="center"><strong><span class="math inline"><em>F</em></span></strong></td>
<td align="center">481.93</td>
</tr>
<tr class="odd">
<td align="center"><strong><span class="math inline"><em>p</em></span></strong></td>
<td align="center">0.00</td>
</tr>
<tr class="even">
<td align="center"><strong><span class="math inline"><em>d</em><em>f</em><sub><em>m</em></sub></span></strong></td>
<td align="center">4.00</td>
</tr>
<tr class="odd">
<td align="center"><strong><span class="math inline"><em>l</em><em>o</em><em>g</em><em>L</em><em>i</em><em>k</em></span></strong></td>
<td align="center">5689.27</td>
</tr>
<tr class="even">
<td align="center"><strong><span class="math inline"><em>A</em><em>I</em><em>C</em></span></strong></td>
<td align="center">-11368.53</td>
</tr>
<tr class="odd">
<td align="center"><strong><span class="math inline"><em>B</em><em>I</em><em>C</em></span></strong></td>
<td align="center">-11337.55</td>
</tr>
<tr class="even">
<td align="center"><strong><span class="math inline"><em>d</em><em>e</em><em>v</em></span></strong></td>
<td align="center">9.23</td>
</tr>
<tr class="odd">
<td align="center"><strong><span class="math inline"><em>d</em><em>f</em><sub><em>e</em></sub></span></strong></td>
<td align="center">3624.00</td>
</tr>
</tbody>
</table>

### Effects plot

#### . ~ Cluster population

<img src="analysis_resilience_two_events_files/figure-markdown_github/unnamed-chunk-23-1.png" style="display: block; margin: auto;" />

#### . ~ Disturbance Event

<img src="analysis_resilience_two_events_files/figure-markdown_github/unnamed-chunk-24-1.png" style="display: block; margin: auto;" />

#### . ~ Cluster population:Elevation

<img src="analysis_resilience_two_events_files/figure-markdown_github/unnamed-chunk-25-1.png" style="display: block; margin: auto;" />

### Post-hoc comparison

    ## 
    ## ### Event ###
    ## $lsmeans
    ##  event    lsmean          SE   df  lower.CL  upper.CL
    ##  2005  0.9374598 0.001184851 3624 0.9351367 0.9397828
    ##  2012  1.0010920 0.001184851 3624 0.9987690 1.0034151
    ## 
    ## Results are averaged over the levels of: clu_pop 
    ## Confidence level used: 0.95 
    ## 
    ## $contrasts
    ##  contrast       estimate          SE   df t.ratio p.value
    ##  2005 - 2012 -0.06363224 0.001675633 3624 -37.975  <.0001
    ## 
    ## Results are averaged over the levels of: clu_pop 
    ## 
    ##  event    lsmean          SE   df  lower.CL  upper.CL .group
    ##  2005  0.9374598 0.001184851 3624 0.9348088 0.9401108  a    
    ##  2012  1.0010920 0.001184851 3624 0.9984410 1.0037430   b   
    ## 
    ## Results are averaged over the levels of: clu_pop 
    ## Confidence level used: 0.95 
    ## Conf-level adjustment: sidak method for 2 estimates 
    ## significance level used: alpha = 0.01 
    ## 
    ## ### Clu pop ###
    ## $lsmeans
    ##  clu_pop    lsmean          SE   df  lower.CL  upper.CL
    ##  N       0.9708277 0.001190715 3624 0.9684932 0.9731623
    ##  S       0.9677241 0.001178958 3624 0.9654126 0.9700355
    ## 
    ## Results are averaged over the levels of: event 
    ## Confidence level used: 0.95 
    ## 
    ## $contrasts
    ##  contrast    estimate          SE   df t.ratio p.value
    ##  N - S    0.003103691 0.001675633 3624   1.852  0.0641
    ## 
    ## Results are averaged over the levels of: event 
    ## 
    ##  clu_pop    lsmean          SE   df  lower.CL  upper.CL .group
    ##  S       0.9677241 0.001178958 3624 0.9650862 0.9703619  a    
    ##  N       0.9708277 0.001190715 3624 0.9681636 0.9734919  a    
    ## 
    ## Results are averaged over the levels of: event 
    ## Confidence level used: 0.95 
    ## Conf-level adjustment: sidak method for 2 estimates 
    ## significance level used: alpha = 0.01 
    ## 
    ## ### Event:Clu pop ###
    ## $lsmeans
    ##  event clu_pop    lsmean          SE   df  lower.CL  upper.CL
    ##  2005  N       0.9391200 0.001683926 3624 0.9358185 0.9424215
    ##  2012  N       1.0025355 0.001683926 3624 0.9992339 1.0058370
    ##  2005  S       0.9357996 0.001667299 3624 0.9325306 0.9390685
    ##  2012  S       0.9996486 0.001667299 3624 0.9963796 1.0029175
    ## 
    ## Confidence level used: 0.95 
    ## 
    ## $contrasts
    ##  contrast            estimate          SE   df t.ratio p.value
    ##  2005,N - 2012,N -0.063415479 0.002381431 3624 -26.629  <.0001
    ##  2005,N - 2005,S  0.003320455 0.002369703 3624   1.401  0.4986
    ##  2005,N - 2012,S -0.060528552 0.002369703 3624 -25.543  <.0001
    ##  2012,N - 2005,S  0.066735934 0.002369703 3624  28.162  <.0001
    ##  2012,N - 2012,S  0.002886927 0.002369703 3624   1.218  0.6152
    ##  2005,S - 2012,S -0.063849007 0.002357917 3624 -27.079  <.0001
    ## 
    ## P value adjustment: tukey method for comparing a family of 4 estimates
