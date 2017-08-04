(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 9.0' *)

(*************************************************************************)
(*                                                                       *)
(*  The Mathematica License under which this file was created prohibits  *)
(*  restricting third parties in receipt of this file from republishing  *)
(*  or redistributing it by any means, including but not limited to      *)
(*  rights management or terms of use, without the express consent of    *)
(*  Wolfram Research, Inc. For additional information concerning CDF     *)
(*  licensing and redistribution see:                                    *)
(*                                                                       *)
(*        www.wolfram.com/cdf/adopting-cdf/licensing-options.html        *)
(*                                                                       *)
(*************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[      1063,         20]
NotebookDataLength[      5478,        216]
NotebookOptionsPosition[      4946,        169]
NotebookOutlinePosition[      5461,        192]
CellTagsIndexPosition[      5418,        189]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["\:65e0\:7ebf\:94fe\:8def\:8ddd\:79bb\:9884\:6d4b", "Title", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell["\:4e00\:3001\:5b9a\:4e49\:53c2\:6570", "Section", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[TextData[{
 "\:53d1\:5c04\:529f\:7387P\:ff08dBm\:ff09dBm=10 ",
 Cell[BoxData[
  FormBox[
   RowBox[{"\[Times]", 
    SubscriptBox["log", "10"]}], TraditionalForm]], "Section"],
 " ",
 Cell[BoxData[
  FormBox[
   RowBox[{"(", 
    FractionBox[
     RowBox[{"5000", "mW"}], 
     RowBox[{"1", "mW"}]], ")"}], TraditionalForm]]],
 "\[TildeTilde]37"
}], "Subsection", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{
  RowBox[{"P", "=", "36"}], ";"}]], "Input", "PluginEmbeddedContent"]
}, Open  ]],

Cell[CellGroupData[{

Cell["\:63a5\:6536\:7075\:654f\:5ea6S\:ff08dBm\:ff09", "Subsection", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{
  RowBox[{"S", "=", 
   RowBox[{"-", "87"}]}], ";"}]], "Input", "PluginEmbeddedContent"]
}, Open  ]],

Cell[CellGroupData[{

Cell["\<\
\:53d1\:5c04\:589e\:76caTx\:ff08dBm\:ff09
\:63a5\:6536\:589e\:76caRx\:ff08dBm\:ff09
\:5929\:7ebf\:589e\:76ca\:3001\:653e\:5927\:5668\:589e\:76ca\:ff08\:53cc\:5411\
\:ff09\
\>", "Subsection", "PluginEmbeddedContent"],

Cell[BoxData[{
 RowBox[{
  RowBox[{"Tx", "=", "9"}], ";"}], "\[IndentingNewLine]", 
 RowBox[{
  RowBox[{"Rx", "=", "9"}], ";"}]}], "Input", "PluginEmbeddedContent"]
}, Open  ]],

Cell[CellGroupData[{

Cell["\:5de5\:4f5c\:9891\:7387 f\:ff08MHz\:ff09", "Subsection", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{
  RowBox[{"f", "=", "2400"}], ";"}]], "Input", "PluginEmbeddedContent"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["\:4e8c\:3001\:5b9a\:4e49\:73af\:5883\:635f\:8017\:ff08dB\:ff09", \
"Section", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{
  RowBox[{"L", "=", "35"}], ";"}]], "Input", "PluginEmbeddedContent"]
}, Open  ]],

Cell[CellGroupData[{

Cell["\:4e09\:3001\:81ea\:7531\:7a7a\:95f4\:7406\:8bba\:4f20\:8f93\:8ddd\:79bb\
\:ff08km\:ff09", "Section", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Solve", "[", 
  RowBox[{
   RowBox[{
    RowBox[{"P", "-", "S", "+", "Rx", "+", "Tx"}], "\[Equal]", 
    RowBox[{"32.44", "+", 
     RowBox[{"20", "  ", 
      RowBox[{"Log10", "[", 
       SubscriptBox["d", "1"], "]"}]}], "+", 
     RowBox[{"20", " ", 
      RowBox[{"Log10", "[", "f", "]"}]}]}]}], ",", 
   SubscriptBox["d", "1"]}], "]"}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"{", 
   RowBox[{
    SubscriptBox["d", "1"], "\[Rule]", "111.63201353412646`"}], "}"}], 
  "}"}]], "Output", "PluginEmbeddedContent"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["\:56db\:3001\:5b9e\:9645\:73af\:5883\:9884\:6d4b\:4f20\:8f93\:8ddd\:79bb\
\:ff08km\:ff09", "Section", "PluginEmbeddedContent"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Solve", "[", 
  RowBox[{
   RowBox[{
    RowBox[{"P", "-", "S", "-", "L", "+", "Rx", "+", "Tx"}], "\[Equal]", 
    RowBox[{"32.44", "+", 
     RowBox[{"20", "  ", 
      RowBox[{"Log10", "[", 
       SubscriptBox["d", "2"], "]"}]}], "+", 
     RowBox[{"20", " ", 
      RowBox[{"Log10", "[", "f", "]"}]}]}]}], ",", 
   SubscriptBox["d", "2"]}], "]"}]], "Input", "PluginEmbeddedContent"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"{", 
   RowBox[{
    SubscriptBox["d", "2"], "\[Rule]", "1.9851291116892342`"}], "}"}], 
  "}"}]], "Output", "PluginEmbeddedContent"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
},
WindowSize->{460, 574},
Visible->True,
AuthoredSize->{460, 574},
ScrollingOptions->{"HorizontalScrollRange"->Fit,
"VerticalScrollRange"->Fit},
ShowCellBracket->False,
Deployed->True,
CellContext->Notebook,
TrackCellChangeTimes->False,
FrontEndVersion->"9.0 for Microsoft Windows (64-bit) (2013\:5e742\:670813\
\:65e5)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[CellGroupData[{
Cell[1485, 35, 90, 0, 61, "Title"],
Cell[CellGroupData[{
Cell[1600, 39, 80, 0, 44, "Section"],
Cell[CellGroupData[{
Cell[1705, 43, 393, 14, 45, "Subsection"],
Cell[2101, 59, 93, 2, 16, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[2231, 66, 93, 0, 29, "Subsection"],
Cell[2327, 68, 112, 3, 16, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[2476, 76, 225, 5, 89, "Subsection"],
Cell[2704, 83, 164, 4, 37, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[2905, 92, 88, 0, 29, "Subsection"],
Cell[2996, 94, 95, 2, 16, "Input"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[3140, 102, 108, 1, 44, "Section"],
Cell[3251, 105, 93, 2, 16, "Input"]
}, Open  ]],
Cell[CellGroupData[{
Cell[3381, 112, 132, 1, 44, "Section"],
Cell[CellGroupData[{
Cell[3538, 117, 400, 11, 37, "Input"],
Cell[3941, 130, 173, 5, 16, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[4163, 141, 132, 1, 44, "Section"],
Cell[CellGroupData[{
Cell[4320, 146, 410, 11, 37, "Input"],
Cell[4733, 159, 173, 5, 16, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature Ix0rH1NAkHLPGBwhOYBme7Bo *)
