import React, { useMemo } from "react";
import { EPageCode } from "./constants/page_code.enum";
import { CTPMain, MafiaMissionsMain, MenuJobMain } from "./pages";
import { useVisibility } from "./providers/VisibilityProvider";
import { debugData } from "./utils/debugData";

debugData([
  {
    action: "setVisible",
    data: true,
  },
]);

debugData([
  {
    action: "pageCode",
    data: "mafia missions",
  },
]);

export const App: React.FC = () => {
  const { pageCode } = useVisibility();

  const pageContent = useMemo(() => {
    switch (pageCode) {
      case EPageCode.ChoseThePath: {
        return <CTPMain />;
      }
      case EPageCode.MenuJob: {
        return <MenuJobMain />;
      }
      case EPageCode.MafiaMissions: {
        return <MafiaMissionsMain />;
      }
      default: {
        return <>Không tìm thấy page code !!!</>;
      }
    }
  }, [pageCode]);

  return <div>{pageContent}</div>;
};

export default App;
