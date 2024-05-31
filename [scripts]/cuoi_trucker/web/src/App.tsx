import { ThemeProvider, createTheme, useTheme } from "@mui/material";
import React, { useMemo } from "react";
import { EPageCode } from "./constants";
import { TDMain } from "./pages";
import { useVisibility } from "./providers";
import { debugData } from "./utils";

debugData([
  {
    action: "setVisible",
    data: true,
  },
]);

debugData([
  {
    action: "pageCode",
    data: EPageCode.TruckerDashBoard,
  },
]);

export const App: React.FC = () => {
  const theme = useTheme();
  const overrideTheme = createTheme({
    spacing: 1,
    typography: {
      fontFamily: [`"Roboto"`, "sans-serif"].join(","),
    },
    palette: {
      primary: { main: "#00C16A" },
    },
    components: {
      MuiButtonBase: {
        styleOverrides: {
          root: {
            paddingInline: `${theme.spacing(2)} !important`,
          },
        },
      },
      MuiIconButton: {
        styleOverrides: {
          root: {
            padding: `${theme.spacing(1)} !important`,
          },
        },
      },
      MuiTypography: {
        styleOverrides: {
          root: {
            fontSize: "14px",
            textTransform: "none",
          },
        },
      },
    },
  });

  const { pageCode } = useVisibility();
  const pageContent = useMemo(() => {
    switch (pageCode) {
      case EPageCode.TruckerDashBoard: {
        return <TDMain />;
      }
      default: {
        return <>Không tìm thấy page code !!!</>;
      }
    }
  }, [pageCode]);

  return (
    <div>
      <ThemeProvider theme={overrideTheme}>{pageContent}</ThemeProvider>
    </div>
  );
};

export default App;
