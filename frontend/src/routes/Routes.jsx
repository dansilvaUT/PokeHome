import { BrowserRouter, Route, Routes } from "react-router-dom";
import Landing from "./Landing/Landing";

const RoutesComp = () => {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Landing />} />
      </Routes>
    </BrowserRouter>
  );
};

export default RoutesComp;
