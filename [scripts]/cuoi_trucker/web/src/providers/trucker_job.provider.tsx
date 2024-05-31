import React, {
  ReactNode,
  createContext,
  useCallback,
  useContext,
  useMemo,
  useState,
} from "react";
import { ETruckerTabId } from "../constants";

interface TruckerJobContextProps {
  tab: string;
  handleSetTab: (newTab: ETruckerTabId) => void;
}

const TruckerJobContext = createContext<TruckerJobContextProps | undefined>(
  undefined
);

// Define the provider component
export const TruckerJobProvider = ({ children }: { children: ReactNode }) => {
  const [tab, setTab] = useState(ETruckerTabId.Vehicles);

  const handleSetTab = useCallback(
    (newTab: ETruckerTabId) => {
      if (tab === newTab) return;
      setTab(newTab);
    },
    [tab]
  );

  const providerProperties = useMemo(
    () => ({
      tab,
      handleSetTab,
    }),
    [tab, handleSetTab]
  );

  return (
    <TruckerJobContext.Provider value={providerProperties}>
      {children}
    </TruckerJobContext.Provider>
  );
};

// Custom hook to access the provider values
export const useTruckerJobProvider = (): TruckerJobContextProps => {
  const context = useContext(TruckerJobContext);
  if (!context) {
    throw new Error(
      "useTruckerJobProvider must be used within a TruckerJobProvider"
    );
  }
  return context;
};
