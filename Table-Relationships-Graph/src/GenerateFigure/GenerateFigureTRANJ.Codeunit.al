/// <summary>
/// Codeunit "GenerateFigureTR_ANJ" (ID 80751).
/// </summary>
codeunit 80751 GenerateFigureTR_ANJ
{
    Access = Public;

    /// <summary>
    /// Generate.
    /// </summary>
    /// <param name="Identity">Text.</param>
    /// <param name="AppName">Text.</param>
    /// <returns>Return variable ReturnText of type Text.</returns>
    internal procedure Generate(Identity: Text; AppName: Text) ReturnText: Text;
    var
        IsHandled: Boolean;
    begin
        OnBeforeGenerate(Identity, AppName, IsHandled);
        ReturnText := DoGenerate(Identity, AppName, IsHandled);
        OnAfterGenerate(ReturnText);
    end;

    /// <summary>
    /// DoGenerate.
    /// </summary>
    /// <param name="Identity">Text.</param>
    /// <param name="AppName">Text.</param>
    /// <param name="IsHandled">Boolean.</param>
    /// <returns>Return value of type Text.</returns>
    local procedure DoGenerate(Identity: Text; AppName: Text; IsHandled: Boolean): Text;
    begin
        if IsHandled then
            exit;

        exit(GenerateFullFigure(Identity, AppName));
    end;

    /// <summary>
    /// GenerateFullFigure.
    /// </summary>
    /// <param name="Identity">Text.</param>
    /// <param name="AppName">Text.</param>
    /// <returns>Return value of type Text.</returns>
    local procedure GenerateFullFigure(Identity: Text; AppName: Text): Text;
    var
        TableRelationshipsGraph: Record TableRelationshipsGraphTR_ANJ;
        FigureInGraph: Interface FigureInGraphTR_ANJ;
    begin
        TableRelationshipsGraph.SetLoadFields(GeometricFigure);
        TableRelationshipsGraph.GetInstance();
        FigureInGraph := TableRelationshipsGraph.GeometricFigure;
        RemoveDisallowedCharacters(AppName);
        exit(FigureInGraph.GenerateFigureText(Identity, AppName));
    end;

    /// <summary>
    /// RemoveDisallowedCharacters.
    /// </summary>
    /// <param name="AppName">VAR Text.</param>
    local procedure RemoveDisallowedCharacters(var AppName: Text);
    begin
        AppName := AppName.Replace('-', '');
        AppName := AppName.Replace('(', '');
        AppName := AppName.Replace(')', '');
        AppName := AppName.Replace('{', '');
        AppName := AppName.Replace('}', '');
        AppName := AppName.Replace('[', '');
        AppName := AppName.Replace(']', '');
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeGenerate(Identity: Text; AppName: Text; var IsHandled: Boolean);
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterGenerate(var ReturnText: Text);
    begin
    end;
}