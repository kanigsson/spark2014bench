(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(declare-fun power (Int Int) Int)

;; Power_0
  (assert (forall ((x Int)) (= (power x 0) 1)))

;; Power_s
  (assert
  (forall ((x Int) (n Int))
  (=> (<= 0 n) (= (power x (+ n 1)) (* x (power x n))))))

;; Power_s_alt
  (assert
  (forall ((x Int) (n Int))
  (=> (< 0 n) (= (power x n) (* x (power x (- n 1)))))))

;; Power_1
  (assert (forall ((x Int)) (= (power x 1) x)))

;; Power_sum
  (assert
  (forall ((x Int) (n Int) (m Int))
  (=> (<= 0 n)
  (=> (<= 0 m) (= (power x (+ n m)) (* (power x n) (power x m)))))))

;; Power_mult
  (assert
  (forall ((x Int) (n Int) (m Int))
  (=> (<= 0 n) (=> (<= 0 m) (= (power x (* n m)) (power (power x n) m))))))

;; Power_comm1
  (assert
  (forall ((x Int) (y Int))
  (=> (= (* x y) (* y x))
  (forall ((n Int)) (=> (<= 0 n) (= (* (power x n) y) (* y (power x n))))))))

;; Power_comm2
  (assert
  (forall ((x Int) (y Int))
  (=> (= (* x y) (* y x))
  (forall ((n Int))
  (=> (<= 0 n) (= (power (* x y) n) (* (power x n) (power y n))))))))

;; Power_non_neg
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (<= 0 y)) (<= 0 (power x y)))))

;; Power_pos
  (assert
  (forall ((x Int) (y Int)) (=> (and (< 0 x) (<= 0 y)) (< 0 (power x y)))))

;; Power_monotonic
  (assert
  (forall ((x Int) (n Int) (m Int))
  (=> (and (< 0 x) (and (<= 0 n) (<= n m))) (<= (power x n) (power x m)))))

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

(declare-fun div1 (Int Int) Int)

(declare-fun mod1 (Int Int) Int)

;; Div_mod
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0)) (= x (+ (* y (div1 x y)) (mod1 x y))))))

;; Div_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (< 0 y)) (and (<= 0 (div1 x y)) (<= (div1 x y) x)))))

;; Mod_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0))
  (and (< (- (abs1 y)) (mod1 x y)) (< (mod1 x y) (abs1 y))))))

;; Div_sign_pos
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< 0 y)) (<= 0 (div1 x y)))))

;; Div_sign_neg
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= x 0) (< 0 y)) (<= (div1 x y) 0))))

;; Mod_sign_pos
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (not (= y 0))) (<= 0 (mod1 x y)))))

;; Mod_sign_neg
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= x 0) (not (= y 0))) (<= (mod1 x y) 0))))

;; Rounds_toward_zero
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0)) (<= (abs1 (* (div1 x y) y)) (abs1 x)))))

;; Div_1
  (assert (forall ((x Int)) (= (div1 x 1) x)))

;; Mod_1
  (assert (forall ((x Int)) (= (mod1 x 1) 0)))

;; Div_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (div1 x y) 0))))

;; Mod_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (mod1 x y) x))))

;; Div_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (and (< 0 x) (and (<= 0 y) (<= 0 z)))
     (= (div1 (+ (* x y) z) x) (+ y (div1 z x)))) :pattern ((div1
                                                            (+ (* x y) z) x)) )))

;; Mod_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (and (< 0 x) (and (<= 0 y) (<= 0 z)))
     (= (mod1 (+ (* x y) z) x) (mod1 z x))) :pattern ((mod1 (+ (* x y) z) x)) )))

(define-fun mod2 ((x Int)
  (y Int)) Int (ite (< 0 y) (mod x y) (+ (mod x y) y)))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(declare-const a1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const a2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const n1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const n2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-const spark__branch Bool)

(declare-const p1 Int)

(declare-const p2 Int)

(declare-const b1 Int)

(declare-const b2 Int)

(declare-const k1 Int)

(declare-const k2 Int)

;; Assume
  (assert (dynamic_invariant a1 true false true true))

;; Assume
  (assert (dynamic_invariant a2 true false true true))

;; Assume
  (assert (dynamic_invariant1 n1 true false true true))

;; Assume
  (assert (dynamic_invariant1 n2 true false true true))

;; Assume
  (assert (dynamic_invariant p1 false false true true))

;; Assume
  (assert (dynamic_invariant p2 false false true true))

;; Assume
  (assert
  (and (and (and (= a1 a2) (= n1 n2)) (or (not (= a1 0)) (not (= n1 0))))
  (< (power a1 n1) 2147483647)))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant b1 false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant b2 false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 k1 false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 k2 false false true true))

(declare-const p11 Int)

;; H
  (assert (= p11 1))

(declare-const b11 Int)

;; H
  (assert (= b11 a1))

(declare-const k11 Int)

;; H
  (assert (= k11 n1))

(declare-const spark__branch1 Bool)

(declare-const p12 Int)

(declare-const k12 Int)

;; H
  (assert
  (ite (< 0 k11)
  (exists ((p13 Int) (b12 Int) (k13 Int))
  (and (and (= (power a1 n1) (* p13 (power b12 k13))) (<= 0 k13))
  (and
  (= (and (ite (and
               (and (dynamic_invariant p13 false true true true)
               (dynamic_invariant b12 false true true true))
               (dynamic_invariant1 k13 false true true true))
          true false) (ite (< 0 k13) true false)) true)
  (exists ((temp___231 Int))
  (and (= temp___231 k13)
  (exists ((b13 Int))
  (and
  (and (= spark__branch1 (ite (= (mod1 k13 2) 0) true false))
  (ite (= spark__branch1 true)
  (and
  (and (= (* p13 (power (* b12 b12) (div1 k13 2))) (power a1 n1))
  (and (= k12 (div1 k13 2))
  (let ((o (* b12 b12))) (and (in_range1 o) (= b13 o))))) (= p12 p13))
  (and
  (and (= (* (* p13 b12) (power b12 (- k13 1))) (power a1 n1))
  (let ((o (- k13 1)))
  (and (in_range2 o)
  (and (= k12 o) (let ((o1 (* b12 p13))) (and (in_range1 o1) (= p12 o1)))))))
  (= b13 b12)))) (not (< 0 k12)))))))))
  (and (and (= spark__branch1 spark__branch) (= p12 p11)) (= k12 k11))))

(declare-const p21 Int)

;; H
  (assert (= p21 1))

(declare-const b21 Int)

;; H
  (assert (= b21 a2))

(declare-const k21 Int)

;; H
  (assert (= k21 n2))

;; H
  (assert (< 0 k21))

(declare-const p22 Int)

(declare-const b22 Int)

(declare-const k22 Int)

;; LoopInvariant
  (assert
  (and
  (and (and (= (power a2 n2) (* p22 (power b22 k22))) (<= 0 k12))
  (<= p22 (power a2 n2))) (<= b22 (power a2 n2))))

;; H
  (assert
  (= (and (ite (and
               (and (dynamic_invariant1 k22 false true true true)
               (dynamic_invariant p22 false true true true))
               (dynamic_invariant b22 false true true true))
          true false) (ite (< 0 k22) true false)) true))

(declare-const temp___242 Int)

;; H
  (assert (= temp___242 k22))

(declare-const p23 Int)

(declare-const b23 Int)

(declare-const k23 Int)

(declare-const spark__branch2 Bool)

;; H
  (assert (= spark__branch2 (ite (= (mod1 k22 2) 0) true false)))

;; H
  (assert
  (ite (= spark__branch2 true)
  (and
  (and (= (* p22 (power (* b22 b22) (div1 k22 2))) (power a2 n2))
  (and (= k23 (div1 k22 2))
  (let ((o (* b22 b22))) (and (in_range1 o) (= b23 o))))) (= p23 p22))
  (and
  (and
  (and (= (* (* p22 b22) (power b22 (- k22 1))) (power a2 n2)) (<= 1 k22))
  (let ((o (- k22 1)))
  (and (in_range2 o)
  (and (= k23 o) (let ((o1 (* b22 p22))) (and (in_range1 o1) (= p23 o1)))))))
  (= b23 b22))))

;; H
  (assert (< 0 k23))

(assert
;; defqtvc
 ;; File "fib.ads", line 29, characters 0-0
  (not (= (power a2 n2) (* p23 (power b23 k23)))))
(check-sat)
