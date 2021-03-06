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
;;; SMT-LIB2: real arithmetic
(define-fun fp.isFinite32 ((x Float32)) Bool (not (or (fp.isInfinite x) (fp.isNaN x))))
(define-fun fp.isIntegral32 ((x Float32)) Bool (or (fp.isZero x) (and (fp.isNormal x) (= x (fp.roundToIntegral RNE x)))))
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

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (positive positive) Bool)

(declare-const dummy2 positive)

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(declare-fun fib (Int) Int)

(declare-fun fib__function_guard (Int Int) Bool)

(declare-fun pow2 (Int) Int)

(define-fun is_plus_infinity ((x Float32)) Bool (and (fp.isInfinite x)
                                                (fp.isPositive x)))

(define-fun is_minus_infinity ((x Float32)) Bool (and (fp.isInfinite x)
                                                 (fp.isNegative x)))

(define-fun is_plus_zero ((x Float32)) Bool (and (fp.isZero x)
                                            (fp.isPositive x)))

(define-fun is_minus_zero ((x Float32)) Bool (and (fp.isZero x)
                                             (fp.isNegative x)))

(declare-fun of_int (RoundingMode Int) Float32)

(declare-const max_int Int)

(define-fun in_int_range ((i Int)) Bool (and (<= (- max_int) i)
                                        (<= i max_int)))

(define-fun in_safe_int_range ((i Int)) Bool (and (<= (- 16777216) i)
                                             (<= i 16777216)))

(define-fun same_sign ((x Float32)
  (y Float32)) Bool (or (and (fp.isPositive x) (fp.isPositive y))
                    (and (fp.isNegative x) (fp.isNegative y))))

(define-fun diff_sign ((x Float32)
  (y Float32)) Bool (or (and (fp.isPositive x) (fp.isNegative y))
                    (and (fp.isNegative x) (fp.isPositive y))))

(define-fun product_sign ((z Float32) (x Float32)
  (y Float32)) Bool (and (=> (same_sign x y) (fp.isPositive z))
                    (=> (diff_sign x y) (fp.isNegative z))))

(define-fun sqr ((x Real)) Real (* x x))

(declare-fun sqrt1 (Real) Real)

(define-fun same_sign_real ((x Float32)
  (r Real)) Bool (or (and (fp.isPositive x) (< 0.0 r))
                 (and (fp.isNegative x) (< r 0.0))))

(declare-datatypes () ((t__ref (t__refqtmk (t__content Float32)))))
(declare-fun power (Float32 Int) Float32)

;; Power_0
  (assert
  (forall ((x Float32))
  (=> (fp.isFinite32 x) (fp.eq (power x 0) (of_int RNE 1)))))

;; Power_1
  (assert
  (forall ((x Float32)) (=> (fp.isFinite32 x) (fp.eq (power x 1) x))))

;; Power_2
  (assert
  (forall ((x Float32))
  (=> (fp.isFinite32 x) (fp.eq (power x 2) (fp.mul RNE x x)))))

;; Power_3
  (assert
  (forall ((x Float32))
  (=> (fp.isFinite32 x) (fp.eq (power x 3) (fp.mul RNE x (fp.mul RNE x x))))))

;; Power_neg1
  (assert
  (forall ((x Float32))
  (=> (fp.isFinite32 x)
  (=> (not (fp.isZero x))
  (fp.eq (power x (- 1)) (fp.div RNE (of_int RNE 1) x))))))

;; Power_neg2
  (assert
  (forall ((x Float32))
  (=> (fp.isFinite32 x)
  (=> (not (fp.isZero x))
  (fp.eq (power x (- 2)) (fp.div RNE (of_int RNE 1) (power x 2)))))))

;; Power_neg3
  (assert
  (forall ((x Float32))
  (=> (fp.isFinite32 x)
  (=> (not (fp.isZero x))
  (fp.eq (power x (- 2)) (fp.div RNE (of_int RNE 1) (power x 3)))))))

(declare-sort fibonacci_argument_type 0)

(declare-fun fibonacci_argument_typeqtint (fibonacci_argument_type) Int)

;; fibonacci_argument_type'axiom
  (assert
  (forall ((i fibonacci_argument_type))
  (and (<= 0 (fibonacci_argument_typeqtint i))
  (<= (fibonacci_argument_typeqtint i) 46))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 46)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (fibonacci_argument_type fibonacci_argument_type) Bool)

(declare-const dummy3 fibonacci_argument_type)

(declare-datatypes ()
((fibonacci_argument_type__ref
 (fibonacci_argument_type__refqtmk
 (fibonacci_argument_type__content fibonacci_argument_type)))))
(define-fun fibonacci_argument_type__ref_fibonacci_argument_type__content__projection ((a fibonacci_argument_type__ref)) fibonacci_argument_type 
  (fibonacci_argument_type__content a))

(define-fun dynamic_invariant2 ((temp___expr_211 Int)
  (temp___is_init_207 Bool) (temp___skip_constant_208 Bool)
  (temp___do_toplevel_209 Bool)
  (temp___do_typ_inv_210 Bool)) Bool (=>
                                     (or (= temp___is_init_207 true)
                                     (<= 0 46)) (in_range4 temp___expr_211)))

;; fib__def_axiom
  (assert
  (forall ((n Int))
  (! (=>
     (and (dynamic_invariant2 n true true true true) (fib__function_guard
     (fib n) n))
     (and (forall ((n1 Int)) (fib__function_guard (fib (- n1 1)) (- n1 1)))
     (and (forall ((n1 Int)) (fib__function_guard (fib (- n1 2)) (- n1 2)))
     (= (fib n) (ite (or (= n 0) (= n 1)) n (+ (fib (- n 1)) (fib (- n 2)))))))) :pattern (
  (fib n)) )))

(declare-const n Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq4 (integer integer) Bool)

(declare-const dummy4 integer)

(declare-datatypes () ((t1b__ref (t1b__refqtmk (t1b__content integer)))))
(define-fun t1b__ref_t1b__content__projection ((a t1b__ref)) integer 
  (t1b__content a))

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

;; fib__post_axiom
  (assert
  (forall ((n1 Int))
  (! (=> (dynamic_invariant2 n1 true true true true)
     (let ((result (fib n1)))
     (=> (fib__function_guard result n1)
     (and
     (fp.lt (of_int RNE result) (fp.add RNE (fp.div RNE (let ((temp___217 (fp #b0 #b01111111 #b10011110001110111100111)))
                                                        (power temp___217 n1)) (fp #b0 #b10000000 #b00011110001101010100000)) (fp #b0 #b01111111 #b00000000000000000000000)))
     (dynamic_invariant result true false true true))))) :pattern ((fib n1)) )))

(declare-const result__ Int)

(declare-const old__ Int)

(declare-const oldest Int)

(declare-const temp Int)

;; Assume
  (assert (dynamic_invariant2 n true false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant result__ false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 old__ false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant oldest false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant temp false false true true))

(declare-const spark__branch Bool)

;; H
  (assert
  (= spark__branch (or (ite (= n 0) true false) (ite (= n 1) true false))))

;; H
  (assert (not (= spark__branch true)))

(declare-const oldest1 Int)

;; H
  (assert (= oldest1 0))

(declare-const old__1 Int)

;; H
  (assert (= old__1 1))

(define-fun temp___227 () Int n)

(declare-const i Int)

;; H
  (assert (= i 2))

;; H
  (assert
  (= (and (ite (<= 2 i) true false) (ite (<= i temp___227) true false)) true))

(define-fun o () Int (- i 2))

;; Ensures
  (assert (in_range4 o))

(define-fun o1 () Int (fib o))

;; H
  (assert (forall ((o2 Int)) (fib__function_guard (fib (- o2 1)) (- o2 1))))

;; H
  (assert (forall ((o2 Int)) (fib__function_guard (fib (- o2 2)) (- o2 2))))

;; H
  (assert (fib__function_guard o1 o))

;; H
  (assert (dynamic_invariant o1 true false true true))

;; H
  (assert
  (= o1 (ite (or (= o 0) (= o 1)) o (+ (fib (- o 1)) (fib (- o 2))))))

;; H
  (assert
  (fp.lt (of_int RNE o1) (fp.add RNE (fp.div RNE (power
                                                 (fp #b0 #b01111111 #b10011110001110111100111)
                                                 o) (fp #b0 #b10000000 #b00011110001101010100000)) (fp #b0 #b01111111 #b00000000000000000000000))))

(define-fun o2 () Int (- i 1))

;; Ensures
  (assert (in_range4 o2))

(define-fun o3 () Int (fib o2))

;; H
  (assert (forall ((o4 Int)) (fib__function_guard (fib (- o4 1)) (- o4 1))))

;; H
  (assert (forall ((o4 Int)) (fib__function_guard (fib (- o4 2)) (- o4 2))))

;; H
  (assert (fib__function_guard o3 o2))

;; H
  (assert (dynamic_invariant o3 true false true true))

;; H
  (assert
  (= o3 (ite (or (= o2 0) (= o2 1)) o2 (+ (fib (- o2 1)) (fib (- o2 2))))))

;; H
  (assert
  (fp.lt (of_int RNE o3) (fp.add RNE (fp.div RNE (power
                                                 (fp #b0 #b01111111 #b10011110001110111100111)
                                                 o2) (fp #b0 #b10000000 #b00011110001101010100000)) (fp #b0 #b01111111 #b00000000000000000000000))))

(declare-const old__2 Int)

(declare-const oldest2 Int)

(declare-const temp1 Int)

(declare-const i1 Int)

;; H
  (assert (forall ((i2 Int)) (fib__function_guard (fib (- i2 1)) (- i2 1))))

;; H
  (assert (forall ((i2 Int)) (fib__function_guard (fib (- i2 2)) (- i2 2))))

;; LoopInvariant
  (assert (and (= old__2 (fib (- i1 1))) (= oldest2 (fib (- i1 2)))))

;; H
  (assert
  (= (and (ite (and
               (and
               (and (dynamic_invariant oldest2 false true true true)
               (dynamic_invariant temp1 false true true true))
               (dynamic_property 2 n i1)) (dynamic_invariant1 old__2 false
               true true true))
          true false) (ite (and (<= 2 i1) (<= i1 n)) true false)) true))

(declare-const temp2 Int)

;; H
  (assert (= temp2 oldest2))

(declare-const oldest3 Int)

;; H
  (assert (= oldest3 old__2))

(define-fun o4 () Int (+ old__2 temp2))

(assert
;; defqtvc
 ;; File "number_theory.ads", line 27, characters 0-0
  (not (in_range1 o4)))
(check-sat)

(exit)
