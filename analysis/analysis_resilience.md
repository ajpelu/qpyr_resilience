    ## Warning: package 'knitr' was built under R version 3.2.5

Exploring patterns of resilience components
===========================================

Models
======

Resilience
----------

### Mean values (Cluster population)

<table style="width:83%;">
<caption>Mean values</caption>
<colgroup>
<col width="20%" />
<col width="13%" />
<col width="15%" />
<col width="16%" />
<col width="16%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">clu_popf</th>
<th align="center">mean</th>
<th align="center">sd</th>
<th align="center">se</th>
<th align="center">variable</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">Camarate</td>
<td align="center">0.9097170</td>
<td align="center">0.03828143</td>
<td align="center">0.002392589</td>
<td align="center">rs</td>
</tr>
<tr class="even">
<td align="center">Northern slope</td>
<td align="center">0.9265084</td>
<td align="center">0.06251420</td>
<td align="center">0.002467239</td>
<td align="center">rs</td>
</tr>
<tr class="odd">
<td align="center">Southern slope</td>
<td align="center">0.9308963</td>
<td align="center">0.05909947</td>
<td align="center">0.002005967</td>
<td align="center">rs</td>
</tr>
</tbody>
</table>

### Summary ANCOVA model

<table style="width:79%;">
<caption>ANOVA table</caption>
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
<td align="center">elev</td>
<td align="center">1</td>
<td align="center">1.518</td>
<td align="center">1.518</td>
<td align="center">672.1</td>
<td align="center"><strong>0</strong></td>
</tr>
<tr class="even">
<td align="center">clu_popf</td>
<td align="center">2</td>
<td align="center">0.4327</td>
<td align="center">0.2164</td>
<td align="center">95.82</td>
<td align="center"><strong>0</strong></td>
</tr>
<tr class="odd">
<td align="center">elev:clu_popf</td>
<td align="center">2</td>
<td align="center">0.07128</td>
<td align="center">0.03564</td>
<td align="center">15.78</td>
<td align="center"><strong>0</strong></td>
</tr>
<tr class="even">
<td align="center">Residuals</td>
<td align="center">1760</td>
<td align="center">3.974</td>
<td align="center">0.00226</td>
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
<td align="center">0.34</td>
</tr>
<tr class="even">
<td align="center"><strong><span class="math inline"><em>a</em><em>d</em><em>j</em><em>R</em><sup>2</sup></span></strong></td>
<td align="center">0.34</td>
</tr>
<tr class="odd">
<td align="center"><strong><span class="math inline"><em>σ</em><sub><em>e</em></sub></span></strong></td>
<td align="center">0.05</td>
</tr>
<tr class="even">
<td align="center"><strong><span class="math inline"><em>F</em></span></strong></td>
<td align="center">179.05</td>
</tr>
<tr class="odd">
<td align="center"><strong><span class="math inline"><em>p</em></span></strong></td>
<td align="center">0.00</td>
</tr>
<tr class="even">
<td align="center"><strong><span class="math inline"><em>d</em><em>f</em><sub><em>m</em></sub></span></strong></td>
<td align="center">6.00</td>
</tr>
<tr class="odd">
<td align="center"><strong><span class="math inline"><em>l</em><em>o</em><em>g</em><em>L</em><em>i</em><em>k</em></span></strong></td>
<td align="center">2877.51</td>
</tr>
<tr class="even">
<td align="center"><strong><span class="math inline"><em>A</em><em>I</em><em>C</em></span></strong></td>
<td align="center">-5741.01</td>
</tr>
<tr class="odd">
<td align="center"><strong><span class="math inline"><em>B</em><em>I</em><em>C</em></span></strong></td>
<td align="center">-5702.68</td>
</tr>
<tr class="even">
<td align="center"><strong><span class="math inline"><em>d</em><em>e</em><em>v</em></span></strong></td>
<td align="center">3.97</td>
</tr>
<tr class="odd">
<td align="center"><strong><span class="math inline"><em>d</em><em>f</em><sub><em>e</em></sub></span></strong></td>
<td align="center">1760.00</td>
</tr>
</tbody>
</table>

### Effects plot

#### . ~ Cluster population

<img src="analysis_resilience_files/figure-markdown_github/unnamed-chunk-8-1.png" style="display: block; margin: auto;" />

#### . ~ Elevation

<img src="analysis_resilience_files/figure-markdown_github/unnamed-chunk-9-1.png" style="display: block; margin: auto;" />

#### . ~ Cluster population:Elevation

<img src="analysis_resilience_files/figure-markdown_github/unnamed-chunk-10-1.png" style="display: block; margin: auto;" />

### Post-hoc comparison

<table style="width:100%;">
<caption>Post hoc comparison (Tukey, alpha = 0.05)</caption>
<colgroup>
<col width="42%" />
<col width="14%" />
<col width="17%" />
<col width="13%" />
<col width="13%" />
</colgroup>
<thead>
<tr class="header">
<th align="center"> </th>
<th align="center">Estimate</th>
<th align="center">Std. Error</th>
<th align="center">t value</th>
<th align="center">Pr(&gt;|t|)</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center"><strong>Northern slope - Camarate</strong></td>
<td align="center">-0.1487</td>
<td align="center">0.0318</td>
<td align="center">-4.67</td>
<td align="center"><strong>0</strong></td>
</tr>
<tr class="even">
<td align="center"><strong>Southern slope - Camarate</strong></td>
<td align="center">-0.101</td>
<td align="center">0.0307</td>
<td align="center">-3.292</td>
<td align="center"><strong>0.0028</strong></td>
</tr>
<tr class="odd">
<td align="center"><strong>Southern slope - Northern slope</strong></td>
<td align="center">0.0477</td>
<td align="center">0.0186</td>
<td align="center">2.567</td>
<td align="center"><strong>0.0264</strong></td>
</tr>
</tbody>
</table>
