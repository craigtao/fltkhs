{-# LANGUAGE CPP, UndecidableInstances, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Fl_Tree_Prefs
       (
         treePrefsNew
       )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_Tree_PrefsC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Dispatch
import Graphics.UI.FLTK.LowLevel.Hierarchy

{# fun unsafe Fl_Tree_Prefs_New as treePrefsNew' {} -> `Ptr ()' id #}
treePrefsNew :: IO (Ref TreePrefs)
treePrefsNew = treePrefsNew' >>= toRef
{# fun unsafe Fl_Tree_Prefs_item_labelfont as itemLabelfont' { id `Ptr ()' } -> `Font' cToFont #}
instance (impl ~ (IO (Font))) => Op (GetItemLabelfont ()) TreePrefs orig impl where
  runOp _ _ tree_prefs = withRef tree_prefs $ \tree_prefsPtr -> itemLabelfont' tree_prefsPtr
{# fun unsafe Fl_Tree_Prefs_item_labelsize as itemLabelsize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ (IO (FontSize))) => Op (GetItemLabelsize ()) TreePrefs orig impl where
  runOp _ _ tree_prefs = withRef tree_prefs $ \tree_prefsPtr -> itemLabelsize' tree_prefsPtr >>= return . FontSize
{# fun unsafe Fl_Tree_Prefs_set_item_labelsize as setItemLabelsize' { id `Ptr ()', id `CInt' } -> `()' #}
instance (impl ~ (FontSize ->  IO ())) => Op (SetItemLabelsize ()) TreePrefs orig impl where
  runOp _ _ tree_prefs (FontSize val) = withRef tree_prefs $ \tree_prefsPtr -> setItemLabelsize' tree_prefsPtr val
{# fun unsafe Fl_Tree_Prefs_set_item_labelfgcolor as setItemLabelfgcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetItemLabelfgcolor ()) TreePrefs orig impl where
  runOp _ _ tree_prefs val = withRef tree_prefs $ \tree_prefsPtr -> setItemLabelfgcolor' tree_prefsPtr val
{# fun unsafe Fl_Tree_Prefs_item_labelbgcolor as itemLabelbgcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ (IO (Color))) => Op (GetItemLabelbgcolor ()) TreePrefs orig impl where
  runOp _ _ tree_prefs = withRef tree_prefs $ \tree_prefsPtr -> itemLabelbgcolor' tree_prefsPtr
{# fun unsafe Fl_Tree_Prefs_set_item_labelbgcolor as setItemLabelbgcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetItemLabelbgcolor ()) TreePrefs orig impl where
  runOp _ _ tree_prefs val = withRef tree_prefs $ \tree_prefsPtr -> setItemLabelbgcolor' tree_prefsPtr val
{# fun unsafe Fl_Tree_Prefs_labelfont as labelfont' { id `Ptr ()' } -> `Font' cToFont #}
instance (impl ~ (IO (Font))) => Op (GetLabelfont ()) TreePrefs orig impl where
  runOp _ _ tree_prefs = withRef tree_prefs $ \tree_prefsPtr -> labelfont' tree_prefsPtr
{# fun unsafe Fl_Tree_Prefs_set_labelfont as setLabelfont' { id `Ptr ()',cFromFont `Font' } -> `()' #}
instance (impl ~ (Font ->  IO ())) => Op (SetLabelfont ()) TreePrefs orig impl where
  runOp _ _ tree_prefs val = withRef tree_prefs $ \tree_prefsPtr -> setLabelfont' tree_prefsPtr val
{# fun unsafe Fl_Tree_Prefs_labelsize as labelsize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ (IO (FontSize))) => Op (GetLabelsize ()) TreePrefs orig impl where
  runOp _ _ tree_prefs = withRef tree_prefs $ \tree_prefsPtr -> labelsize' tree_prefsPtr >>= return . FontSize
{# fun unsafe Fl_Tree_Prefs_set_labelsize as setLabelsize' { id `Ptr ()', id `CInt' } -> `()' #}
instance (impl ~ (FontSize ->  IO ())) => Op (SetLabelsize ()) TreePrefs orig impl where
  runOp _ _ tree_prefs (FontSize val) = withRef tree_prefs $ \tree_prefsPtr -> setLabelsize' tree_prefsPtr val
{# fun unsafe Fl_Tree_Prefs_labelfgcolor as labelfgcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ (IO (Color))) => Op (GetLabelfgcolor ()) TreePrefs orig impl where
  runOp _ _ tree_prefs = withRef tree_prefs $ \tree_prefsPtr -> labelfgcolor' tree_prefsPtr
{# fun unsafe Fl_Tree_Prefs_set_labelfgcolor as setLabelfgcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetLabelfgcolor ()) TreePrefs orig impl where
  runOp _ _ tree_prefs val = withRef tree_prefs $ \tree_prefsPtr -> setLabelfgcolor' tree_prefsPtr val
{# fun unsafe Fl_Tree_Prefs_labelbgcolor as labelbgcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ (IO (Color))) => Op (GetLabelbgcolor ()) TreePrefs orig impl where
  runOp _ _ tree_prefs = withRef tree_prefs $ \tree_prefsPtr -> labelbgcolor' tree_prefsPtr
{# fun unsafe Fl_Tree_Prefs_set_labelbgcolor as setLabelbgcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetLabelbgcolor ()) TreePrefs orig impl where
  runOp _ _ tree_prefs val = withRef tree_prefs $ \tree_prefsPtr -> setLabelbgcolor' tree_prefsPtr val
{# fun unsafe Fl_Tree_Prefs_marginleft as marginleft' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (IO (Int))) => Op (GetMarginleft ()) TreePrefs orig impl where
  runOp _ _ tree_prefs = withRef tree_prefs $ \tree_prefsPtr -> marginleft' tree_prefsPtr
{# fun unsafe Fl_Tree_Prefs_set_marginleft as setMarginleft' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetMarginleft ()) TreePrefs orig impl where
  runOp _ _ tree_prefs val = withRef tree_prefs $ \tree_prefsPtr -> setMarginleft' tree_prefsPtr val
{# fun unsafe Fl_Tree_Prefs_margintop as margintop' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (IO (Int))) => Op (GetMargintop ()) TreePrefs orig impl where
  runOp _ _ tree_prefs = withRef tree_prefs $ \tree_prefsPtr -> margintop' tree_prefsPtr
{# fun unsafe Fl_Tree_Prefs_set_margintop as setMargintop' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetMargintop ()) TreePrefs orig impl where
  runOp _ _ tree_prefs val = withRef tree_prefs $ \tree_prefsPtr -> setMargintop' tree_prefsPtr val
{# fun unsafe Fl_Tree_Prefs_openchild_marginbottom as openchildMarginbottom' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (IO (Int))) => Op (GetOpenchildMarginbottom ()) TreePrefs orig impl where
  runOp _ _ tree_prefs = withRef tree_prefs $ \tree_prefsPtr -> openchildMarginbottom' tree_prefsPtr
{# fun unsafe Fl_Tree_Prefs_set_openchild_marginbottom as setOpenchildMarginbottom' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetOpenchildMarginbottom ()) TreePrefs orig impl where
  runOp _ _ tree_prefs val = withRef tree_prefs $ \tree_prefsPtr -> setOpenchildMarginbottom' tree_prefsPtr val
{# fun unsafe Fl_Tree_Prefs_usericonmarginleft as usericonmarginleft' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (IO (Int))) => Op (GetUsericonmarginleft ()) TreePrefs orig impl where
  runOp _ _ tree_prefs = withRef tree_prefs $ \tree_prefsPtr -> usericonmarginleft' tree_prefsPtr
{# fun unsafe Fl_Tree_Prefs_set_usericonmarginleft as setUsericonmarginleft' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetUsericonmarginleft ()) TreePrefs orig impl where
  runOp _ _ tree_prefs val = withRef tree_prefs $ \tree_prefsPtr -> setUsericonmarginleft' tree_prefsPtr val
{# fun unsafe Fl_Tree_Prefs_labelmarginleft as labelmarginleft' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (IO (Int))) => Op (GetLabelmarginleft ()) TreePrefs orig impl where
  runOp _ _ tree_prefs = withRef tree_prefs $ \tree_prefsPtr -> labelmarginleft' tree_prefsPtr
{# fun unsafe Fl_Tree_Prefs_set_labelmarginleft as setLabelmarginleft' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetLabelmarginleft ()) TreePrefs orig impl where
  runOp _ _ tree_prefs val = withRef tree_prefs $ \tree_prefsPtr -> setLabelmarginleft' tree_prefsPtr val
{# fun unsafe Fl_Tree_Prefs_linespacing as linespacing' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (IO (Int))) => Op (GetLinespacing ()) TreePrefs orig impl where
  runOp _ _ tree_prefs = withRef tree_prefs $ \tree_prefsPtr -> linespacing' tree_prefsPtr
{# fun unsafe Fl_Tree_Prefs_set_linespacing as setLinespacing' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetLinespacing ()) TreePrefs orig impl where
  runOp _ _ tree_prefs val = withRef tree_prefs $ \tree_prefsPtr -> setLinespacing' tree_prefsPtr val
{# fun unsafe Fl_Tree_Prefs_connectorcolor as connectorcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ (IO (Color))) => Op (GetConnectorcolor ()) TreePrefs orig impl where
  runOp _ _ tree_prefs = withRef tree_prefs $ \tree_prefsPtr -> connectorcolor' tree_prefsPtr
{# fun unsafe Fl_Tree_Prefs_set_connectorcolor as setConnectorcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetConnectorcolor ()) TreePrefs orig impl where
  runOp _ _ tree_prefs val = withRef tree_prefs $ \tree_prefsPtr -> setConnectorcolor' tree_prefsPtr val
{# fun unsafe Fl_Tree_Prefs_connectorstyle as connectorstyle' { id `Ptr ()' } -> `TreeConnector' cToEnum #}
instance (impl ~ (IO (TreeConnector))) => Op (GetConnectorstyle ()) TreePrefs orig impl where
  runOp _ _ tree_prefs = withRef tree_prefs $ \tree_prefsPtr -> connectorstyle' tree_prefsPtr
{# fun unsafe Fl_Tree_Prefs_set_connectorstyle_with_tree_connector as setConnectorstyle' { id `Ptr ()',cFromEnum  `TreeConnector' } -> `()' #}
instance (impl ~ (TreeConnector -> IO ())) => Op (SetConnectorstyle ()) TreePrefs orig impl where
  runOp _ _ tree_prefs val = withRef tree_prefs $ \tree_prefsPtr -> setConnectorstyle' tree_prefsPtr val
{# fun unsafe Fl_Tree_Prefs_connectorwidth as connectorwidth' { id `Ptr ()' } -> `Int' #}
instance (impl ~ (IO (Int))) => Op (GetConnectorwidth ()) TreePrefs orig impl where
  runOp _ _ tree_prefs = withRef tree_prefs $ \tree_prefsPtr -> connectorwidth' tree_prefsPtr
{# fun unsafe Fl_Tree_Prefs_set_connectorwidth as setConnectorwidth' { id `Ptr ()',`Int' } -> `()' #}
instance (impl ~ (Int ->  IO ())) => Op (SetConnectorwidth ()) TreePrefs orig impl where
  runOp _ _ tree_prefs val = withRef tree_prefs $ \tree_prefsPtr -> setConnectorwidth' tree_prefsPtr val
{# fun unsafe Fl_Tree_Prefs_openicon as openicon' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ (IO (Ptr ()))) => Op (GetOpenicon ()) TreePrefs orig impl where
  runOp _ _ tree_prefs = withRef tree_prefs $ \tree_prefsPtr -> openicon' tree_prefsPtr
{# fun unsafe Fl_Tree_Prefs_set_openicon as setOpenicon' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (Parent a Image, impl ~ (Ref a  ->  IO ())) => Op (SetOpenicon ()) TreePrefs orig impl where
  runOp _ _ tree_prefs val = withRef tree_prefs $ \tree_prefsPtr -> withRef val $ \valPtr -> setOpenicon' tree_prefsPtr valPtr
{# fun unsafe Fl_Tree_Prefs_closeicon as closeicon' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ (IO (Ptr ()))) => Op (GetCloseicon ()) TreePrefs orig impl where
  runOp _ _ tree_prefs = withRef tree_prefs $ \tree_prefsPtr -> closeicon' tree_prefsPtr
{# fun unsafe Fl_Tree_Prefs_set_closeicon as setCloseicon' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (Parent a Image, impl ~ (Ref a  ->  IO ())) => Op (SetCloseicon ()) TreePrefs orig impl where
  runOp _ _ tree_prefs val = withRef tree_prefs $ \tree_prefsPtr -> withRef val $ \valPtr -> setCloseicon' tree_prefsPtr valPtr
{# fun unsafe Fl_Tree_Prefs_usericon as usericon' { id `Ptr ()' } -> `Ptr ()' id #}
instance (impl ~ (IO (Ptr ()))) => Op (GetUsericon ()) TreePrefs orig impl where
  runOp _ _ tree_prefs = withRef tree_prefs $ \tree_prefsPtr -> usericon' tree_prefsPtr
{# fun unsafe Fl_Tree_Prefs_set_usericon as setUsericon' { id `Ptr ()',id `Ptr ()' } -> `()' #}
instance (Parent a Image, impl ~ (Ref a  ->  IO ())) => Op (SetUsericon ()) TreePrefs orig impl where
  runOp _ _ tree_prefs val = withRef tree_prefs $ \tree_prefsPtr -> withRef val $ \valPtr -> setUsericon' tree_prefsPtr valPtr
{# fun unsafe Fl_Tree_Prefs_showcollapse as showcollapse' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (IO (Bool))) => Op (GetShowcollapse ()) TreePrefs orig impl where
  runOp _ _ tree_prefs = withRef tree_prefs $ \tree_prefsPtr -> showcollapse' tree_prefsPtr
{# fun unsafe Fl_Tree_Prefs_set_showcollapse as setShowcollapse' { id `Ptr ()', cFromBool `Bool' } -> `()' #}
instance (impl ~ (Bool ->  IO ())) => Op (SetShowcollapse ()) TreePrefs orig impl where
  runOp _ _ tree_prefs val = withRef tree_prefs $ \tree_prefsPtr -> setShowcollapse' tree_prefsPtr val
{# fun unsafe Fl_Tree_Prefs_sortorder as sortorder' { id `Ptr ()' } -> `TreeSort' cToEnum #}
instance (impl ~ (IO (TreeSort))) => Op (GetSortorder ()) TreePrefs orig impl where
  runOp _ _ tree_prefs = withRef tree_prefs $ \tree_prefsPtr -> sortorder' tree_prefsPtr
{# fun unsafe Fl_Tree_Prefs_set_sortorder as setSortorder' { id `Ptr ()', cFromEnum `TreeSort' } -> `()' #}
instance (impl ~ (TreeSort ->  IO ())) => Op (SetSortorder ()) TreePrefs orig impl where
  runOp _ _ tree_prefs val = withRef tree_prefs $ \tree_prefsPtr -> setSortorder' tree_prefsPtr val
{# fun unsafe Fl_Tree_Prefs_selectbox as selectbox' { id `Ptr ()' } -> `Boxtype' cToEnum #}
instance (impl ~ (IO (Boxtype))) => Op (GetSelectbox ()) TreePrefs orig impl where
  runOp _ _ tree_prefs = withRef tree_prefs $ \tree_prefsPtr -> selectbox' tree_prefsPtr
{# fun unsafe Fl_Tree_Prefs_set_selectbox as setSelectbox' { id `Ptr ()',cFromEnum `Boxtype' } -> `()' #}
instance (impl ~ (Boxtype ->  IO ())) => Op (SetSelectbox ()) TreePrefs orig impl where
  runOp _ _ tree_prefs val = withRef tree_prefs $ \tree_prefsPtr -> setSelectbox' tree_prefsPtr val
{# fun unsafe Fl_Tree_Prefs_showroot as showroot' { id `Ptr ()' } -> `Bool' cToBool #}
instance (impl ~ (IO (Bool))) => Op (GetShowroot ()) TreePrefs orig impl where
  runOp _ _ tree_prefs = withRef tree_prefs $ \tree_prefsPtr -> showroot' tree_prefsPtr
{# fun unsafe Fl_Tree_Prefs_set_showroot as setShowroot' { id `Ptr ()', cFromBool `Bool' } -> `()' #}
instance (impl ~ (Bool ->  IO ())) => Op (SetShowroot ()) TreePrefs orig impl where
  runOp _ _ tree_prefs val = withRef tree_prefs $ \tree_prefsPtr -> setShowroot' tree_prefsPtr val
{# fun unsafe Fl_Tree_Prefs_selectmode as selectmode' { id `Ptr ()' } -> `TreeSelect' cToEnum #}
instance (impl ~ (IO (TreeSelect))) => Op (GetSelectmode ()) TreePrefs orig impl where
  runOp _ _ tree_prefs = withRef tree_prefs $ \tree_prefsPtr -> selectmode' tree_prefsPtr
{# fun unsafe Fl_Tree_Prefs_set_selectmode as setSelectmode' { id `Ptr ()', cFromEnum `TreeSelect' } -> `()' #}
instance (impl ~ (TreeSelect ->  IO ())) => Op (SetSelectmode ()) TreePrefs orig impl where
  runOp _ _ tree_prefs val = withRef tree_prefs $ \tree_prefsPtr -> setSelectmode' tree_prefsPtr val
