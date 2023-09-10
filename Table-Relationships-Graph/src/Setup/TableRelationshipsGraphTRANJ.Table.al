/// <summary>
/// Table "TableRelationshipsGraphTR_ANJ" (ID 80750).
/// </summary>
table 80750 TableRelationshipsGraphTR_ANJ
{
    Access = Internal;
    Caption = 'Table Relationships Graph';
    DataClassification = CustomerContent;
    DrillDownPageID = TableRelationshipsGraphTR_ANJ;
    LookupPageID = TableRelationshipsGraphTR_ANJ;

    fields
    {
        field(1; PrimaryKey; Code[10])
        {
            Caption = 'Primary Key';
            NotBlank = false;
        }
        field(2; GeometricFigure; Enum GeometricFigureTR_ANJ)
        {
            Caption = 'Geometric Figure';
        }
        field(3; DateLastGeneration; Date)
        {
            Caption = 'Date';
        }
        field(4; TimeLastGeneration; Time)
        {
            Caption = 'Time';
        }
        field(5; Markdown; Blob)
        {
            Caption = 'Content Text';
        }
        field(6; MarkdownMermaid; Blob)
        {
            Caption = 'Mermaid Content Text';
        }
    }
    keys
    {
        key(PK; PrimaryKey)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; PrimaryKey, GeometricFigure)
        {
        }
        fieldgroup(Brick; PrimaryKey, GeometricFigure)
        {
        }
    }

    /// <summary>
    /// SetMarkdown.
    /// </summary>
    /// <param name="AuxText">Text.</param>
    /// <param name="FieldNo">Integer.</param>
    internal procedure SetMarkdown(AuxText: Text; FieldNo: Integer);
    var
        AuxOutStream: OutStream;
    begin
        Clear(HasBeenRead);
        case FieldNo of
            FieldNo(Markdown):
                Markdown.CreateOutStream(AuxOutStream);
            FieldNo(MarkdownMermaid):
                MarkdownMermaid.CreateOutStream(AuxOutStream);
        end;
        AuxOutStream.Write(AuxText);
    end;

    /// <summary>
    /// GetInstance.
    /// </summary>
    procedure GetInstance();
    begin
        if HasBeenRead then
            exit;

        if not Get() then begin
            Init();
            Insert(true);
        end;
        HasBeenRead := true;
    end;

    var
        HasBeenRead: Boolean;
}