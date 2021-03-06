{-# LANGUAGE CPP, ExistentialQuantification, TypeSynonymInstances, FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, ScopedTypeVariables #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}
module Graphics.UI.FLTK.LowLevel.Counter
    (
     -- * Constructor
     counterNew,
     CounterType(..)
     -- * Hierarchy
     --
     -- $hierarchy

     -- * Functions
     --
     -- $Counterfunctions
     --
    )
where
#include "Fl_ExportMacros.h"
#include "Fl_Types.h"
#include "Fl_CounterC.h"
#include "Fl_WidgetC.h"
import C2HS hiding (cFromEnum, cFromBool, cToBool,cToEnum)
import Foreign.C.Types
import Graphics.UI.FLTK.LowLevel.Fl_Enumerations
import Graphics.UI.FLTK.LowLevel.Fl_Types
import Graphics.UI.FLTK.LowLevel.Utils
import Graphics.UI.FLTK.LowLevel.Hierarchy
import Graphics.UI.FLTK.LowLevel.Dispatch
import qualified Data.Text as T
#c
enum CounterType {
  NormalCounterType = FL_NORMAL_COUNTERC,
  SimpleCounterType = FL_SIMPLE_COUNTERC
};
#endc
{#enum CounterType {} deriving (Show, Eq) #}
{# fun Fl_Counter_New as counterNew' { `Int',`Int',`Int',`Int' } -> `Ptr ()' id #}
{# fun Fl_Counter_New_WithLabel as counterNewWithLabel' { `Int',`Int',`Int',`Int', unsafeToCString `T.Text'} -> `Ptr ()' id #}
counterNew :: Rectangle -> Maybe T.Text -> IO (Ref Counter)
counterNew rectangle l'=
    let (x_pos, y_pos, width, height) = fromRectangle rectangle
    in case l' of
        Nothing -> counterNew' x_pos y_pos width height >>=
                             toRef
        Just l -> counterNewWithLabel' x_pos y_pos width height l >>=
                               toRef

{# fun Fl_Counter_Destroy as counterDestroy' { id `Ptr ()' } -> `()' supressWarningAboutRes #}
instance (impl ~ (IO ())) => Op (Destroy ()) Counter orig impl where
  runOp _ _ win = swapRef win $ \winPtr -> do
    counterDestroy' winPtr
    return nullPtr

{#fun Fl_Counter_handle as counterHandle' { id `Ptr ()', id `CInt' } -> `Int' #}
instance (impl ~ (Event -> IO (Either UnknownEvent ()))) => Op (Handle ()) Counter orig impl where
  runOp _ _ counter event = withRef counter (\p -> counterHandle' p (fromIntegral . fromEnum $ event)) >>= return . successOrUnknownEvent
{# fun Fl_Counter_lstep as lstep' { id `Ptr ()',`Double' } -> `()' #}
instance (impl ~ (Double ->  IO ())) => Op (SetLstep ()) Counter orig impl where
  runOp _ _ counter lstep = withRef counter $ \counterPtr -> lstep' counterPtr lstep
{# fun Fl_Counter_set_textfont as setTextfont' { id `Ptr ()',cFromFont `Font' } -> `()' #}
instance (impl ~ (Font ->  IO ())) => Op (SetTextfont ()) Counter orig impl where
  runOp _ _ counter text = withRef counter $ \counterPtr -> setTextfont' counterPtr text
{# fun Fl_Counter_textfont as textfont' { id `Ptr ()' } -> `Font' cToFont #}
instance (impl ~ ( IO (Font))) => Op (GetTextfont ()) Counter orig impl where
  runOp _ _ counter = withRef counter $ \counterPtr -> textfont' counterPtr
{# fun Fl_Counter_set_textsize as setTextsize' { id `Ptr ()', id `CInt' } -> `()' #}
instance (impl ~ (FontSize ->  IO ())) => Op (SetTextsize ()) Counter orig impl where
  runOp _ _ counter (FontSize text) = withRef counter $ \counterPtr -> setTextsize' counterPtr text
{# fun Fl_Counter_textsize as textsize' { id `Ptr ()' } -> `CInt' id #}
instance (impl ~ ( IO (FontSize))) => Op (GetTextsize ()) Counter orig impl where
  runOp _ _ counter = withRef counter $ \counterPtr -> textsize' counterPtr >>= return . FontSize
{# fun Fl_Counter_set_textcolor as setTextcolor' { id `Ptr ()',cFromColor `Color' } -> `()' #}
instance (impl ~ (Color ->  IO ())) => Op (SetTextcolor ()) Counter orig impl where
  runOp _ _ counter text = withRef counter $ \counterPtr -> setTextcolor' counterPtr text
{# fun Fl_Counter_textcolor as textcolor' { id `Ptr ()' } -> `Color' cToColor #}
instance (impl ~ ( IO (Color))) => Op (GetTextcolor ()) Counter orig impl where
  runOp _ _ counter = withRef counter $ \counterPtr -> textcolor' counterPtr
{# fun Fl_Widget_set_type as setType' { id `Ptr ()',`Word8' } -> `()' supressWarningAboutRes #}
instance (impl ~ (CounterType ->  IO ())) => Op (SetType ()) Counter orig impl where
  runOp _ _ widget t = withRef widget $ \widgetPtr -> setType' widgetPtr (fromInteger $ toInteger $ fromEnum t)
{# fun Fl_Widget_type as type' { id `Ptr ()' } -> `Word8' #}
instance (impl ~ IO (CounterType)) => Op (GetType_ ()) Counter orig impl where
  runOp _ _ widget = withRef widget $ \widgetPtr -> type' widgetPtr >>= return . toEnum . fromInteger . toInteger

-- $Counterfunctions
--
-- @
-- destroy :: 'Ref' 'Counter' -> 'IO' ()
--
-- getTextcolor :: 'Ref' 'Counter' -> 'IO' 'Color'
--
-- getTextfont :: 'Ref' 'Counter' -> 'IO' 'Font'
--
-- getTextsize :: 'Ref' 'Counter' -> 'IO' 'FontSize'
--
-- handle :: 'Ref' 'Counter' -> ('Event' -> 'IO' ('Either' 'UnknownEvent' ()))
--
-- setLstep :: 'Ref' 'Counter' -> 'Double' -> 'IO' ()
--
-- setTextcolor :: 'Ref' 'Counter' -> 'Color' -> 'IO' ()
--
-- setTextfont :: 'Ref' 'Counter' -> 'Font' -> 'IO' ()
--
-- setTextsize :: 'Ref' 'Counter' -> 'FontSize' -> 'IO' ()
--
-- @

-- $hierarchy
-- @
-- "Graphics.UI.FLTK.LowLevel.Widget"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Valuator"
--  |
--  v
-- "Graphics.UI.FLTK.LowLevel.Counter"
-- @
