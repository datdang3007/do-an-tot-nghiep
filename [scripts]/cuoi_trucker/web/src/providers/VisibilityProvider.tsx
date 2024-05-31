import React, {
  Context,
  createContext,
  useContext,
  useEffect,
  useMemo,
  useState,
} from "react";
import { EPageCode } from "../constants/page_code.enum";
import { useNuiEvent } from "../hooks/useNuiEvent";
import { fetchNui } from "../utils/fetchNui";

const VisibilityCtx = createContext<VisibilityProviderValue | null>(null);

interface VisibilityProviderValue {
  visible: boolean;
  canClose: boolean;
  pageCode: EPageCode | null;
  setVisible: (visible: boolean) => void;
  setCanClose: (canClose: boolean) => void;
}

export const VisibilityProvider: React.FC = ({ children }) => {
  const [visible, setVisible] = useState<boolean>(false);
  const [canClose, setCanClose] = useState<boolean>(false);
  const [pageCode, setPageCode] = useState<EPageCode | null>(null);

  useNuiEvent<boolean>("setVisible", setVisible);
  useNuiEvent<boolean>("canClose", setCanClose);
  useNuiEvent<EPageCode | null>("pageCode", setPageCode);

  // Handle pressing escape/backspace
  useEffect(() => {
    // Only attach listener when we are visible
    if (!visible && !canClose) return;
    const keyHandler = (e: KeyboardEvent) => {
      if (["Backspace", "Escape"].includes(e.code)) {
        fetchNui("hideFrame");
      }
    };
    window.addEventListener("keydown", keyHandler);
    return () => window.removeEventListener("keydown", keyHandler);
  }, [visible, canClose]);

  const value = useMemo(
    () => ({
      visible,
      canClose,
      pageCode,
      setVisible,
      setCanClose,
    }),
    [visible, canClose, pageCode, setVisible, setCanClose]
  );

  return (
    <VisibilityCtx.Provider value={value}>
      <div style={{ display: visible ? "block" : "none", height: "100%" }}>
        {children}
      </div>
    </VisibilityCtx.Provider>
  );
};

export const useVisibility = () =>
  useContext<VisibilityProviderValue>(
    VisibilityCtx as Context<VisibilityProviderValue>
  );
