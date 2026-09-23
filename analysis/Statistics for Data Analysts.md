# Statistics for Data Analysts: The Complete 3-Level Path

You commented STATS, so here it is. The whole thing.

This is the guide I wish someone had handed me before my first analyst interview. Not a textbook. Not a 40-hour course. Just the statistics that actually shows up in Canadian data analyst jobs, split into three levels, with the interview questions, worked examples on real Canadian data, and a clear list of what you are allowed to ignore.

Read it once end to end. Then come back and work one level at a time.

---

## First, the honest map

Most people learning statistics for data analytics do the same three things.

They finish Level 1, feel good, and think they know statistics.

They get bored somewhere in Level 2 and jump to machine learning because it sounds better.

They never go back.

Here is the problem. Level 2 is the only level that reliably shows up in a data analyst interview. It is the level where a hiring manager finds out whether you can actually make a decision with data or whether you just know how to calculate an average.

So the order matters more than the total volume.

| Level | What it is | Time to get functional | Shows up in interviews |
| --- | --- | --- | --- |
| Level 1 | Descriptive statistics | 1 to 2 weeks | Sometimes, as a warm-up |
| Level 2 | Inferential statistics | 3 to 4 weeks | Almost always |
| Level 3 | Regression and modeling | 3 to 4 weeks | Sometimes, and it separates you |

Total honest estimate: about 8 weeks of real part-time work. Not six months. Not a masters degree.

One more thing before we start. You do not need to be good at math. You need to be good at explaining. Every question in this guide is really asking the same thing: can you take a number and tell a non-technical person what to do about it.

---

# LEVEL 1: Descriptive Statistics

## What this level actually is

Describing data you already have. No predictions, no claims about a wider population. Just: what does this dataset look like.

This is the level everybody finishes, which is exactly why it wins you nothing on its own. Finish it fast and move on.

## What to learn

**Measures of centre**

- Mean, median, mode
- When the median beats the mean, and why that is a business decision not a math one

**Measures of spread**

- Range, variance, standard deviation
- Interquartile range and the 5-number summary
- Coefficient of variation, for comparing spread across things measured on different scales

**Shape and position**

- Percentiles and quartiles
- Skew, left and right, and what a long tail does to your average
- Outliers, how to spot them with the 1.5 times IQR rule, and the harder question of whether to remove them

**Distributions**

- Normal distribution and the 68, 95, 99.7 rule
- Uniform, binomial and Poisson at a conceptual level
- Long-tailed distributions, because almost all real business data is long-tailed

**Relationships between two variables**

- Covariance, briefly
- Correlation coefficient, what values mean, and its limits

## Worked example: why your average salary number is lying

Here are nine data analyst salaries pulled from one company's team, in CAD.

```
62,000  65,000  68,000  70,000  72,000  75,000  78,000  82,000  210,000
```

That last one is the director who sits in the same cost centre.

- **Mean:** 782,000 divided by 9 = **$86,889**
- **Median:** the 5th value = **$72,000**
- **Standard deviation:** about **$46,600**

The mean is nearly $15,000 above what any actual analyst on that team earns. One value did that.

Now drop the director and recalculate on the eight analysts.

- **Mean:** $71,500
- **Median:** $71,000
- **Standard deviation:** about **$6,700**

The standard deviation collapsed from $46,600 to $6,700. That is the whole lesson. A standard deviation that is huge relative to the mean is not a boring summary stat. It is a warning light telling you your average is not describing anybody.

**What you say to a stakeholder:** "The average is $86,889 but the typical analyst earns $72,000. One senior role is pulling the average up. I would report the median."

That sentence is worth more in an interview than being able to write the variance formula.

## The four mistakes people make at Level 1

1. **Reporting the mean by default.** Salary, revenue per customer, session length, time to hire. All skewed. Use the median and say why.
2. **Deleting outliers to make the chart look nice.** An outlier is a data point until you have a documented reason it is an error. "It ruins my average" is not a reason.
3. **Confusing correlation with a strong relationship.** A correlation of 0.6 between two things you cannot explain is noise with good PR.
4. **Not looking at the distribution before summarising it.** Plot a histogram first. Always. The summary stats come second.

## Free resources for Level 1

- [Khan Academy Statistics and Probability](https://www.khanacademy.org/math/statistics-probability). Start at descriptive statistics. Free, and the practice problems are the useful part.
- [Seeing Theory](https://seeing-theory.brown.edu/), from Brown University. Interactive animations. Spend an evening here and distributions stop being abstract.
- [StatQuest with Josh Starmer](https://www.youtube.com/@statquest) on YouTube. The best plain-language explanations of statistics anywhere. Watch the Statistics Fundamentals playlist.

## How you know you are done with Level 1

You can open a CSV you have never seen, produce a 5-number summary, plot the distribution, spot the skew, decide between mean and median, and explain that choice in one sentence to someone who does not work in data.

That is it. Move on.

---

# LEVEL 2: Inferential Statistics

## This is the level that gets you hired

Inferential statistics is the jump from "here is what happened in my data" to "here is what I believe is true about the world, and here is how confident I am."

Every business question worth asking is an inference question.

- Did the new checkout page actually work, or did we get lucky for a week?
- Is this customer segment genuinely churning faster, or is that a 40-person sample?
- Should we roll this out to all of Canada based on a Toronto pilot?

Canadian companies judge you here. Banks, insurance, telco, retail, fintech. This is the round where they find out if you can be trusted with a decision.

## What to learn

### 1. Sampling

- Population versus sample, and why you almost never have the population
- Random, stratified, cluster and convenience sampling
- Sampling bias, survivorship bias, selection bias
- Sampling distribution of the mean
- The Central Limit Theorem

**The Central Limit Theorem in plain English:** if you take enough samples of decent size, the averages of those samples form a normal distribution, even when the underlying data is not normal. That is why you can use normal-distribution tools on messy real data. That is the entire reason inferential statistics works.

### 2. Correlation versus causation

- Confounding variables
- Spurious correlation
- Simpson's paradox
- Why a randomised experiment is the only clean way to claim causation

### 3. Confidence intervals

- Standard error, and how it differs from standard deviation
- Margin of error
- 90, 95 and 99 percent intervals and the tradeoff between them
- How sample size moves the interval

### 4. Hypothesis testing

- Null and alternative hypotheses
- Significance level, alpha
- p-values
- Type I error, false positive, and Type II error, false negative
- Statistical power
- One-tailed versus two-tailed
- Which test to use: z-test, t-test, chi-square test, ANOVA

### 5. A/B testing

- Designing the test: metric, hypothesis, randomisation unit
- Calculating sample size before you launch
- Minimum detectable effect
- Peeking, and why it destroys your results
- Practical significance versus statistical significance
- Novelty effect, seasonality, sample ratio mismatch

---

## Worked example 1: a confidence interval you can defend

You survey 400 recent graduates in Canada. 148 of them landed an interview within three months of starting their search.

**Point estimate:** 148 divided by 400 = **37%**

That number alone is useless. It is one sample. Here is the interval.

```
Standard error = sqrt( 0.37 × 0.63 / 400 ) = 0.0241
Margin of error at 95% = 1.96 × 0.0241 = 0.047
```

**95% confidence interval: 32.3% to 41.7%**

**What it means:** if you repeated this survey many times, about 95 out of 100 of the intervals you built this way would contain the true rate. It does **not** mean there is a 95% chance the true value sits in this one interval. Interviewers ask this exact distinction constantly.

**What you say to a stakeholder:** "Roughly a third get an interview within three months. Our best estimate is 37%, and the real number is very likely between 32% and 42%."

**The follow-up they will ask:** "How do we narrow that range?" Increase the sample size. But the margin of error shrinks with the square root of n, so to cut the range in half you need four times the sample. 1,600 people, not 800. Knowing that tradeoff is a senior-sounding answer.

---

## Worked example 2: a full A/B test, start to finish

A Canadian ecommerce company tests a new checkout page.

|  | Visitors | Conversions | Rate |
| --- | --- | --- | --- |
| Control | 12,000 | 480 | 4.00% |
| Variant | 12,000 | 540 | 4.50% |

The variant looks better. Absolute lift of 0.5 percentage points, relative lift of 12.5%. The product manager wants to ship it Monday.

Run the numbers.

```
Pooled rate = (480 + 540) / 24,000 = 4.25%
Standard error = sqrt( 0.0425 × 0.9575 × (1/12,000 + 1/12,000) ) = 0.00260
z = 0.005 / 0.00260 = 1.92
Two-sided p-value ≈ 0.055
```

**p = 0.055.** Above the 0.05 threshold. Not statistically significant.

And the confidence interval on the difference runs from about **-0.01 to +1.01 percentage points**. It crosses zero, which means "the new page is slightly worse" is still on the table.

Now the part almost nobody does. Was this test ever capable of detecting a 0.5pp lift?

```
Required sample per arm ≈ 16 × p × (1 - p) / (effect size)²
                        = 16 × 0.04 × 0.96 / 0.005²
                        ≈ 24,600 per arm
```

They needed about 24,600 per group at 80% power. They ran 12,000. The test was underpowered before it launched. Even if the new page genuinely is better, this experiment had a coin-flip chance of proving it.

**What you say in the room:** "We are at p equals 0.055, so we cannot call this a win. But the bigger issue is that we sized the test for 12,000 per arm when detecting a half-point lift needs about 24,600. I would run it two more weeks rather than throw the result away."

That answer covers the statistics, the design flaw and the business recommendation. That is a Level 2 answer, and it is the difference between getting the offer and getting the thanks-for-coming email.

**The trap to avoid:** do not check the p-value daily and stop the moment it dips under 0.05. That is called peeking, and it inflates your false positive rate well past 5%. Decide the sample size up front. Run it. Then look.

---

## Worked example 3: Simpson's paradox, and why aggregates lie

A bank tests a new digital onboarding flow. Here is what happened.

**Old flow**

| Device | Users | Signups | Rate |
| --- | --- | --- | --- |
| Mobile | 1,000 | 45 | 4.5% |
| Desktop | 9,000 | 1,035 | 11.5% |
| Total | 10,000 | 1,080 | 10.8% |

**New flow**

| Device | Users | Signups | Rate |
| --- | --- | --- | --- |
| Mobile | 9,000 | 450 | 5.0% |
| Desktop | 1,000 | 120 | 12.0% |
| Total | 10,000 | 570 | 5.7% |

Look carefully.

On mobile, the new flow wins: 5.0% against 4.5%.

On desktop, the new flow wins: 12.0% against 11.5%.

Overall, the new flow loses badly: 5.7% against 10.8%.

The new flow is better in every single segment and worse in total. That is Simpson's paradox. It happened because the traffic mix was different. The new flow got mostly mobile users, and mobile converts worse on both flows.

The real finding is not "the new flow failed." The real finding is "our randomisation is broken, the two groups are not comparable, and this test cannot be read at all."

The original case that made this famous is the 1973 UC Berkeley admissions lawsuit, where the university looked like it was rejecting women overall, but no individual department was. Women were applying in higher numbers to the departments that admitted fewer people.

**The habit to build:** before you report any aggregate number, break it out by your two or three biggest segments. If the story flips, you have found something.

## Free resources for Level 2

- [OpenIntro Statistics](https://www.openintro.org/book/os/). A genuinely free, genuinely good university textbook. Chapters on inference, hypothesis testing and confidence intervals are the ones you want.
- [StatQuest](https://www.youtube.com/@statquest), the Statistics Fundamentals and Hypothesis Testing playlists. Watch p-values, confidence intervals and statistical power in that order.
- [Evan Miller's A/B test sample size calculator](https://www.evanmiller.org/ab-testing/sample-size.html). Use it on every test you design. Plug in your baseline rate and the lift you care about and see how big the sample has to be. This single tool teaches power analysis faster than any lecture.
- [Seeing Theory](https://seeing-theory.brown.edu/), the Frequentist Inference and Probability Distributions chapters.

## How you know you are done with Level 2

You can design an A/B test, calculate the sample size before it launches, read the result correctly, explain a p-value to a marketing manager without using the word "null," and tell the difference between a result that is significant and a result that matters.

---

# LEVEL 2 INTERVIEW QUESTIONS

These are the ones that actually come up. Answers written the way you should say them out loud, not the way a textbook writes them.

### Fundamentals

**1. Explain a p-value to someone non-technical.**

"If the new version made no difference at all, a p-value of 0.03 says there is only a 3% chance we would see a result this big just from random noise. It is low enough that I think something real is happening."

Never say a p-value is the probability the hypothesis is true. That is the most common wrong answer given, and interviewers listen for it.

**2. What is the Central Limit Theorem and why do you care?**

"If I take repeated samples and average them, those averages form a normal distribution even if my raw data is skewed. It is why I can use normal-based tests on revenue data that is nowhere near normal."

**3. Explain a confidence interval.**

"It is a range around my estimate. A 95% confidence interval means that if I repeated this process many times, 95% of the intervals I build would contain the true value. It is a statement about the method, not about this one interval."

**4. Difference between standard deviation and standard error.**

"Standard deviation describes how spread out the individual data points are. Standard error describes how much my estimate of the average would bounce around if I resampled. Standard error shrinks as the sample grows. Standard deviation does not."

**5. When do you use the median over the mean?**

"Whenever the data is skewed or has outliers. Salary, revenue per customer, session duration, claim size. Anything with a long tail."

**6. What is a normal distribution and does real data follow it?**

"Symmetric, bell-shaped, 68% within one standard deviation, 95% within two. And mostly no. Most business data is right-skewed. The normal distribution matters because of what it does to sample averages, not because raw data looks like it."

### Hypothesis testing

**7. Walk me through setting up a hypothesis test.**

"State the null, usually no difference. State the alternative. Pick the significance level, normally 0.05. Pick the test based on the data type. Calculate the statistic and p-value. Compare to alpha. Then translate the result into a business recommendation."

**8. Type I versus Type II error, and which is worse?**

"Type I is a false positive, saying something works when it does not. Type II is a false negative, missing a real effect. Which is worse depends entirely on cost. Shipping a broken payments change is expensive, so I would protect against Type I. Missing a cheap growth win is less costly, so there I would care more about power."

**9. What is statistical power and what drives it?**

"The chance of detecting a real effect when it exists. Standard target is 80%. It is driven by sample size, the size of the effect you are chasing, the variance in the data, and your alpha."

**10. You get p equals 0.06. What do you do?**

"I do not call it a win, and I do not call it a failure. I check whether the test was powered for the effect I was looking for. If it was underpowered, the honest answer is the test was inconclusive and I would extend it. What I will not do is move the threshold after seeing the result."

**11. t-test versus z-test versus chi-square versus ANOVA.**

"t-test compares means with a small sample or unknown population variance. z-test compares means with a large sample and known variance. Chi-square tests relationships between categorical variables. ANOVA compares means across three or more groups."

**12. What does a 95% significance level actually cost you?**

"It means I accept a 5% false positive rate. If I run 20 tests where nothing is really happening, I should expect one to come back significant anyway. That is why running a lot of tests requires a correction or a lot of scepticism."

### A/B testing

**13. Design an A/B test for a new checkout button.**

"Define the primary metric, checkout completion rate. Set guardrail metrics like revenue per user and refund rate. Write the hypothesis. Randomise at the user level, not the session level, so a returning user always sees the same version. Calculate sample size from the baseline rate and the smallest lift worth shipping. Run for at least one full week to cover the weekly cycle. Analyse once at the end."

**14. How do you pick the sample size?**

"It comes from four inputs. Baseline conversion rate, the minimum effect I care about detecting, the significance level, and the power target. Smaller effects need dramatically bigger samples. Halving the effect size roughly quadruples the sample you need."

**15. What is a minimum detectable effect and why set one first?**

"It is the smallest improvement that would actually change a decision. If a 0.1% lift would not be worth the engineering cost, do not size a test to find it. Setting the MDE first stops you running tests that could never have been conclusive."

**16. Why is peeking at results a problem?**

"Every time you look and consider stopping, you get another chance to catch random noise crossing the threshold. Checking daily on a two-week test can push your real false positive rate well above 5%. Either commit to the end date, or use a sequential testing method built for it."

**17. Your test is significant with a 0.2% lift. Ship it?**

"Statistically yes, practically probably not. I would compare the revenue that 0.2% represents against the cost to build and maintain it. Statistical significance says the effect is probably real. It says nothing about whether it is worth anything."

**18. Your A/B test shows a huge lift in week one that fades by week three. What happened?**

"Most likely a novelty effect. Existing users notice the change and interact with it because it is new. I would look at new users only, since they have no baseline to compare against, and I would run the test longer before calling it."

**19. Control has 10,000 users and variant has 11,500. Is that a problem?**

"Yes. That is a sample ratio mismatch. A 50-50 split should not drift that far. It usually means a bug in the assignment logic, a redirect failing, or bot traffic landing in one arm. I would stop and debug before reading any result, because the groups are no longer comparable."

### Correlation and causation

**20. Explain correlation versus causation with an example.**

"Ice cream sales correlate with drownings. Neither causes the other. Hot weather causes both. That third variable is a confounder. The only reliable way to claim causation is a randomised experiment, because randomisation balances out the confounders you did not think of."

**21. What is Simpson's paradox?**

"A trend that shows up in every subgroup but reverses when you pool the data. It happens when group sizes differ. The fix is always the same: segment before you conclude. The Berkeley admissions case from 1973 is the classic example."

**22. Sales and marketing spend have a correlation of 0.85. What do you tell the CMO?**

"That they move together strongly, and that is worth knowing. But it does not prove spend drives sales. Both could be rising with seasonality, or we could be spending more precisely because sales are good. To make a causal claim I would want a geo holdout test or a period where spend was cut in some regions and not others."

### The one they use to separate candidates

**23. Our conversion rate dropped 15% last week. How do you investigate?**

Do not jump to a cause. Say this:

"First I check whether it is real or a tracking issue, because a broken event is the most common cause of a sudden drop. Then I check whether 15% is outside normal weekly variation, since some of these metrics swing 10% on a quiet week. Then I segment: device, channel, region, new versus returning, browser version. A real cause is almost always concentrated in one segment, not spread evenly. Then I line it up against a release log or a campaign change. And I would tell the stakeholder what I know and what I am still checking, rather than guessing on the spot."

Structure is what they are scoring. Not the answer.

---

# LEVEL 3: Regression and Modeling

## Who this level is for

You can get hired as a data analyst without Level 3. You cannot get past a certain ceiling without it.

This is where you stop describing what happened and start quantifying relationships. It is the border with data science, and knowing it well is the single clearest way to look like the strongest analyst in a candidate pool.

## What to learn

**Linear regression**

- Simple and multiple linear regression
- How to interpret a coefficient, which matters far more than how to fit one
- R-squared and adjusted R-squared, and why a high R-squared is not a good model on its own
- p-values on individual coefficients
- The assumptions: linearity, independence, constant variance, normal residuals
- Multicollinearity and why correlated inputs wreck your interpretation

**Logistic regression**

- What changes when the outcome is yes or no
- Log-odds and odds ratios
- The classification threshold, and why 0.5 is rarely the right one
- Precision, recall, the confusion matrix and AUC
- Class imbalance, which is the default state of churn and fraud data

**Basic time series**

- Trend, seasonality and residual
- Moving averages
- Year over year and month over month comparison done properly
- Why you never randomly shuffle time series data

## Worked example: reading a regression like an analyst

You model daily Bike Share Toronto trips against temperature. The output looks like this. These numbers are illustrative, but this is the shape of what you get.

```
trips_per_day = 1,200 + 480 × temperature_celsius
R² = 0.68
p-value on temperature < 0.001
```

**How to read it, line by line.**

- **480** is the coefficient. Every 1 degree Celsius increase is associated with about 480 more trips per day. Say "associated with," not "causes."
- **1,200** is the intercept. Technically the predicted trips at 0 degrees. Often not meaningful on its own, and that is fine.
- **R-squared of 0.68** means temperature explains about 68% of the day-to-day variation in trips. The other 32% is rain, day of week, holidays, events.
- **p below 0.001** means the relationship is very unlikely to be noise.

**Now the analyst part, which is what the interview is really testing.**

- Do not extrapolate. The model has never seen 45 degrees. It will happily give you a number. Ignore it.
- Watch the confounder. Temperature and month are tangled together in Toronto. Some of that 480 is really "it is summer," which brings tourists and students, not just warmth.
- A high R-squared is not proof of a good model. Plot the residuals. If they fan out or curve, the linear form is wrong.

**For logistic regression**, the interpretation shifts. A coefficient of 0.69 on "had a support ticket last month" is in log-odds. Exponentiate it and you get an odds ratio of about 2.0, which you say out loud as: "customers who raised a support ticket last month have roughly double the odds of churning."

That translation, from coefficient to a sentence a business person can act on, is the whole skill.

## Free resources for Level 3

- [An Introduction to Statistical Learning](https://www.statlearning.com/). Free PDF, with Python and R editions. Chapters 3 and 4, linear and logistic regression, are the two you need. Skip the rest for now.
- [StatQuest](https://www.youtube.com/@statquest), the Linear Regression and Logistic Regression playlists. Watch before touching the book.
- [OpenIntro Statistics](https://www.openintro.org/book/os/), the regression chapters.

## How you know you are done with Level 3

You can fit a regression, read every number in the output, explain one coefficient in a sentence with no jargon, name the assumption most likely to be violated, and say what you would check next.

---

# What you can safely skip

This is the section that saves you the most time, so read it twice.

**Skip entirely, as a data analyst:**

- **Deep learning and neural networks.** Zero relevance to an analyst role. If the job needed it, it would not be called analyst.
- **Proofs and derivations.** Nobody will ask you to derive the t-statistic. They will ask you to interpret one.
- **Bayesian statistics.** Genuinely interesting, occasionally used in mature experimentation teams, and not required to get hired as an analyst. Come back to it later if you want.
- **Advanced probability theory.** Measure theory, stochastic processes, none of it.
- **Advanced ML: random forests, gradient boosting, SVMs, clustering algorithms at depth.** Know what they are and what problem they solve. Do not spend weeks on them before Level 2 is solid.
- **Multivariate techniques: PCA, factor analysis, MANOVA.** Rarely used in analyst work.
- **Non-parametric tests beyond knowing they exist.** Know that Mann-Whitney and Wilcoxon are the options when your data is badly non-normal. That is enough.
- **Doing any of this by hand.** You will use Python, R, SQL or a calculator every single time. Understand the logic, not the arithmetic.

**Learn the name only, then move on:**

Bootstrapping, survival analysis, ARIMA, Bayesian A/B testing, causal inference methods like difference-in-differences. Know roughly what each one does so you are not lost when a senior mentions it. Do not study them yet.

**The rule of thumb:** if it would not change a business decision you could realistically be asked to support, it is not Level 2, and it can wait.

---

# Where to practice, with Canadian data

Reading statistics does not work. You have to run these calculations on real messy data. Here is where to get it, all free.

- [**Statistics Canada open data**](https://www.statcan.gc.ca/en/our-data/where/open-data) and the [full data portal](https://www150.statcan.gc.ca/n1/en/type/data). Labour force survey, income, housing, population. Real national data with real documentation. The Public Use Microdata Files are row-level, which is what you want for practising distributions and inference rather than reading someone's finished summary table.
- [**Open Government Canada**](https://open.canada.ca/en/open-data). Federal datasets across every department.
- [**City of Toronto Open Data**](https://open.toronto.ca/). The best starting point for a portfolio project. Bike Share ridership has over 19 million trip records across dozens of monthly files, which is enough volume to do a real analysis and enough mess to learn something. TTC ridership and service data is here too.
- [**Kaggle Datasets**](https://www.kaggle.com/datasets). Filter for Canadian data, or use it for clean practice sets when you want to focus on the statistics rather than the cleaning.

**Three projects that force you through all three levels:**

1. **Level 1 and 2:** Take Bike Share Toronto ridership for two years. Describe the distribution of trip durations, it will be badly right-skewed. Then test whether weekend trips are genuinely longer than weekday trips, and report a confidence interval on the difference, not just the averages.
2. **Level 2:** Build a simulated A/B test from any conversion dataset. Size it properly before you run it. Then deliberately peek at it daily and watch how often you would have called a false winner. Nothing teaches peeking like doing it once.
3. **Level 3:** Regress daily bike trips on temperature, day of week and precipitation. Interpret every coefficient in plain language. Then plot the residuals and write down what the model is getting wrong.

Each of those is a portfolio piece and an interview story at the same time.

---

# If you only remember four things

1. **Level 2 is where the jobs are.** Descriptive statistics is the warm-up. Regression is the bonus. Inference is the interview.
2. **Interpretation beats calculation.** Every question is secretly "can you explain this to a stakeholder." Practise saying things out loud.
3. **Always segment before you conclude.** The aggregate number is the one most likely to be lying to you.
4. **Size the test before you run it.** A test that was never powered to find the effect cannot tell you anything, no matter what the p-value says at the end.

Eight weeks of honest work on this puts you ahead of most people applying for the same roles. Not because the material is hard, but because almost nobody finishes Level 2.

---

## What to do next

If you want people to actually check your work on this, come join the free community. That is where the masterclass recordings live, where the events get announced first, and where you can post your bike share analysis and have someone tell you what you got wrong.

[**Join the free ORU community on Skool**](https://www.skool.com/oru-8321/about)

And if you want direct mentorship from data engineers and analysts already working at Canadian companies, weekly live sessions and interview prep, that is what ORU is: [**joinoru.com**](https://joinoru.com/)

All the best.

Sahil