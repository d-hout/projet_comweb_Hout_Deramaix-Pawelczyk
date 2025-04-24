import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'
import PageAccueilConnexion from './PageAccueilConnexion'

function App() {
  const [count, setCount] = useState(0)

  return (
    <>
    <PageAccueilConnexion/>
    </>
  )
}

export default App
