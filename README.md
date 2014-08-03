# The `X-POLITY` Index (Vreeland 2008)

The [`polity2` index](http://www.systemicpeace.org/polityproject.html "Polity Project") is often used to measure a state's political regime on an autocracy-democracy scale. However, as [Vreeland (2008)](http://faculty.georgetown.edu/jrv24/polityproblem.html "Vreeland (2008)") emphasizes, the use of `polity2` in research *on civil war* is *highly problematic* due to some of the index's components (namely `PARREG` and `PARCOMP`) that are defined with clear references to civil war. Thus, the often found U-shaped relationship between `polity2` and civil war (the so-called *anocracy hypothesis*) might only be an artifact. Vreeland's (2008: 407) proposition reads as follows:

> “Considering the various ways in which political violence 
> and civil war enter into the coding of the Polity data, 
> using the aggregate Polity index to measure the effect of 
> anocracy on civil war may not be a good idea. Fortunately, 
> the Polity data provide the components of the index. 
> Researchers can thus construct a new index, leaving out the 
> problematic components. […] This variable, which I call X-POLITY 
> because it includes only the components associated with the 
> executive, ranges from −6 to +7.”

While Vreeland provides a ready-to-use [*Stata* datafile](http://www9.georgetown.edu/faculty/jrv24/XPOLITY.dta "X-Polity Stata File"), it only contains `X-POLITY` scores up to 2004. Moreover, Vreeland did not publish any syntax files. Hence, this repository contains R and CSV data files with updated `X-POLITY` scores based on the newest polity IV dataset (p4v2013) as well as the R-script used to create them.

# Files in this repository
- [XPolity.R](https://github.com/n-klotz/X-Polity-Index/blob/master/XPolity.R): R-Script that downloads the 2013 polity IV dataset, recodes the relevant `polity2` components and calculates `X-POLITY` scores.
- [xpolity_1800-2013.RData](https://github.com/n-klotz/X-Polity-Index/blob/master/xpolity_1800-2013.RData): R dataset containing the entire polity IV dataset plus the `X-POLITY` scores and the recoded components from 1800 to 2013.
- [xpolity_1800-2013.csv](https://github.com/n-klotz/X-Polity-Index/blob/master/xpolity_1800-2013.csv): The same dataset as comma-seperated CSV file.

# Construction of the `X-POLITY` index
To constuct the `X-POLITY` index, three of the initial five `polity2` components are used (`XCONST`, `XRCOMP` and `XROPEN`). They are recoded according to Marshall / Gurr / Jaggers (2014: 14ff.) and Vreeland (2008: 405). Their sum forms the `X-POLITY` index.

# Codebook
- `xpolity`: The X-Polity value for every country-year
- `xconst_xpolity`: Recoded *Executive Constraints* component
- `xrcomp_xpolity`: Recoded *Competitiveness of Executive Recruitment* component
- `xropen_xpolity`: Recoded *Openness of Executive Recruitment* component
- For all other variables, see Marshall/Gurr/Jaggers (2014)

# Bibliography
- **Marshall, Monty G. / Gurr, Ted R. / Jaggers, Keith (2014)**: [Polity IV Project. Data Users' Manual. Center for Systemic Peace](http://www.systemicpeace.org/inscr/p4manualv2013.pdf).
- **Vreeland, James R. (2008)**: [The Effect of Political Regime on Civil War. Unpacking Anocracy. *Journal of Conflict Resolution* 52(3), 401-425](http://jcr.sagepub.com/content/52/3/401.abstract).
