_L =
COALESCE ( COUNTROWS ( Fact_Funnel ), 0 )



_CompPct =
VAR CurrFTE = [rel_FTE]
VAR PrevFTE =
    CALCULATE ( [rel_FTE], DATEADD ( Dim_Date[Date], -1, QUARTER ) )
RETURN
DIVIDE ( CurrFTE, PrevFTE, 0 )



rel_ExpectedStart_Next3Months =
VAR LastSelectedDate = MAX ( Dim_Date[Date] )
VAR StartDate = LastSelectedDate + 1
VAR EndDate = EDATE ( LastSelectedDate, 3 )
VAR Result =
    CALCULATE (
        COUNTROWS ( Fact_Funnel ),
        NOT ISBLANK ( Fact_Funnel[ExpectedStartDate] ),
        NOT ISBLANK ( Fact_Funnel[RegistrationDate] ),
        USERELATIONSHIP ( Fact_Funnel[ExpectedStartDate], Dim_Date[Date] ),
        REMOVEFILTERS ( Dim_Date ),
        DATESBETWEEN ( Dim_Date[Date], StartDate, EndDate )
    )
RETURN
COALESCE ( Result, 0 )



rel_Registration =
CALCULATE (
    COALESCE ( COUNT ( Fact_Funnel[RegistrationDate] ), 0 ),
    USERELATIONSHIP ( Fact_Funnel[RegistrationDate], Dim_Date[Date] )
)



_UVB =
VAR DatesInScope = VALUES ( Dim_Date[Date] )
RETURN
COALESCE (
    CALCULATE (
        DISTINCTCOUNT ( Fact_Funnel[RecordId] ),
        KEEPFILTERS ( TREATAS ( DatesInScope, Fact_Funnel[CreatedDate] ) ),
        KEEPFILTERS ( TREATAS ( DatesInScope, Fact_Funnel[VisitDate] ) ),
        NOT ISBLANK ( Fact_Funnel[VisitDate] )
    ),
    0
)



rel_UVB =
COALESCE (
    CALCULATE (
        COUNTROWS ( Fact_Funnel ),
        USERELATIONSHIP ( Fact_Funnel[VisitDate], Dim_Date[Date] ),
        KEEPFILTERS ( NOT ISBLANK ( Fact_Funnel[VisitDate] ) )
    ),
    0
)



rel_Exits =
COALESCE (
    CALCULATE (
        COUNTROWS ( Fact_ExitForm ),
        USERELATIONSHIP ( Fact_ExitForm[ExitDate], Dim_Date[Date] ),
        Fact_ExitForm[Status] = "Approved",
        NOT ISBLANK ( Fact_ExitForm[ExitDate] )
    ),
    0
)



_LeadToVisitCompleted_Days =
VAR BaseTable =
    FILTER (
        Fact_Funnel,
        NOT ISBLANK ( Fact_Funnel[CreatedDate] )
            && NOT ISBLANK ( Fact_Funnel[VisitDate] )
            && Fact_Funnel[VisitCompletedFlag] = "Yes"
    )
VAR Result =
    AVERAGEX (
        BaseTable,
        VAR d =
            DATEDIFF ( Fact_Funnel[CreatedDate], Fact_Funnel[VisitDate], DAY )
        RETURN IF ( d < 0, 0, d )
    )
RETURN
COALESCE ( Result, 0 )