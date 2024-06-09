import {
  DirectionsCarRounded,
  Factory,
  StoreRounded,
} from "@mui/icons-material";
import {
  ReactNode,
  createContext,
  useCallback,
  useContext,
  useEffect,
  useMemo,
  useState,
} from "react";
import { EPageCode, ETruckerTabId } from "../constants";
import { ISideBar } from "../interfaces";

interface TruckerJobContextProps {
  tab: string;
  listSideBar: ISideBar[];
  handleSetTab: (newTab: ETruckerTabId) => void;
}

const TruckerJobContext = createContext<TruckerJobContextProps | undefined>(
  undefined
);

// Define the provider component
export const TruckerJobProvider = ({
  pageCode,
  children,
}: {
  pageCode: string;
  children: ReactNode;
}) => {
  const [tab, setTab] = useState(ETruckerTabId.Vehicles);

  const handleSetTab = useCallback(
    (newTab: ETruckerTabId) => {
      if (tab === newTab) return;
      setTab(newTab);
    },
    [tab]
  );

  const listSideBar = useMemo(() => {
    if (pageCode === EPageCode.TruckerTablet) {
      return [
        {
          text: "Thị trường",
          icon: <StoreRounded />,
          tab: ETruckerTabId.Markets,
        },
        {
          text: "Nhà cung cấp",
          icon: <Factory />,
          tab: ETruckerTabId.Suppliers,
        },
      ];
    }
    return [
      {
        text: "Phương tiện",
        icon: <DirectionsCarRounded />,
        tab: ETruckerTabId.Vehicles,
      },
      {
        text: "Thị trường",
        icon: <StoreRounded />,
        tab: ETruckerTabId.Markets,
      },
      {
        text: "Nhà cung cấp",
        icon: <Factory />,
        tab: ETruckerTabId.Suppliers,
      },
    ];
  }, [pageCode]);

  useEffect(() => {
    switch (pageCode) {
      case EPageCode.TruckerDashBoard: {
        setTab(ETruckerTabId.Vehicles);
        break;
      }
      case EPageCode.TruckerTablet: {
        setTab(ETruckerTabId.Markets);
        break;
      }
      default: {
        return;
      }
    }
  }, [pageCode]);

  const providerProperties = useMemo(
    () => ({
      tab,
      listSideBar,
      handleSetTab,
    }),
    [tab, listSideBar, handleSetTab]
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
