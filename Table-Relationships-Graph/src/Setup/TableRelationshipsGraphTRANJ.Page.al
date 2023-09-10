/// <summary>
/// Page "TableRelationshipsGraphTR_ANJ" (ID 80750).
/// </summary>
page 80750 TableRelationshipsGraphTR_ANJ
{
    ApplicationArea = All;
    Caption = 'Table Relationships Graph';
    PageType = Card;
    SourceTable = TableRelationshipsGraphTR_ANJ;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {

            group(Figure)
            {
                Caption = 'App shapes inside the diagram';

                field(GeometricFigure; Rec.GeometricFigure)
                {
                    ToolTip = 'Specifies the value of the Scope PTE Figure field.';
                }
            }

            group(LastGeneration)
            {
                Caption = 'Last time it was generated';

                group(Tables)
                {
                    Caption = 'Tables to customize the graph';

                    field(DateLastGeneration; Rec.DateLastGeneration)
                    {
                        Editable = false;
                        ToolTip = 'Specifies the value of the Date Last Generation field.';
                    }
                    field(TimeLastGeneration; Rec.TimeLastGeneration)
                    {
                        Editable = false;
                        ToolTip = 'Specifies the value of the Time Last Generation field.';
                    }
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.GetInstance();
    end;
}