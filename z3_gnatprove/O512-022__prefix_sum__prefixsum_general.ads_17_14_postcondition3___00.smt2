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

(declare-fun is_even (Int) Bool)

(declare-fun is_even__function_guard (Bool Int) Bool)

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

;; is_even__post_axiom
  (assert true)

;; is_even__def_axiom
  (assert
  (forall ((k Int))
  (! (= (= (is_even k) true) (= (mod2 k 2) 0)) :pattern ((is_even k)) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int integer))))))
(declare-fun slide ((Array Int integer) Int Int) (Array Int integer))

;; slide_eq
  (assert
  (forall ((a (Array Int integer)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int integer)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int integer)) (a__first Int) (a__last Int)
  (b (Array Int integer)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (= (to_rep (select a temp___idx_155)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_155)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int integer)) (b (Array Int integer)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (= (to_rep (select a temp___idx_155)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_155)))))))))))

(declare-fun summation ((Array Int integer) Int Int) Int)

(declare-fun summation__function_guard (Int (Array Int integer) Int
  Int) Bool)

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index)) (and (<= 0 (indexqtint i)) (<= (indexqtint i) 7))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 7)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (index index) Bool)

(declare-const dummy3 index)

(declare-datatypes () ((index__ref (index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(define-fun dynamic_invariant3 ((temp___expr_162 Int)
  (temp___is_init_158 Bool) (temp___skip_constant_159 Bool)
  (temp___do_toplevel_160 Bool)
  (temp___do_typ_inv_161 Bool)) Bool (=>
                                     (or (= temp___is_init_158 true)
                                     (<= 0 7)) (in_range4 temp___expr_162)))

;; summation__post_axiom
  (assert
  (forall ((a (Array Int integer)))
  (forall ((start_pos Int) (end_pos Int))
  (! (=>
     (and
     (and (dynamic_invariant3 start_pos true true true true)
     (dynamic_invariant3 end_pos true true true true))
     (<= start_pos end_pos))
     (let ((result (summation a start_pos end_pos)))
     (and (=> (= start_pos end_pos) (= result (to_rep (select a start_pos))))
     (dynamic_invariant2 result true false true true)))) :pattern ((summation
                                                                   a
                                                                   start_pos
                                                                   end_pos)) ))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const a_old (Array Int integer))

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const a (Array Int integer))

(declare-const output_space Int)

(declare-const left Int)

(declare-const right Int)

(declare-const a1 (Array Int integer))

;; H
  (assert (= a1 a))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 output_space false false true true))

;; Assume
  (assert
  (forall ((k Int))
  (=> (and (<= 0 k) (<= k 7))
  (let ((temp___218 (to_rep (select a k))))
  (and (<= (- 268435455) temp___218) (<= temp___218 268435455))))))

(declare-const space Int)

;; H
  (assert (= space 1))

;; Assume
  (assert (dynamic_invariant1 space true false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant left false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant right false false true true))

;; Assume
  (assert (= a a_old))

;; Assume
  (assert true)

(declare-const a2 (Array Int integer))

(declare-const space1 Int)

;; H
  (assert
  (ite (< space 8)
  (exists ((temp___loop_entry_207 (Array Int integer)))
  (and (= temp___loop_entry_207 a)
  (exists ((temp___loop_entry_208 (Array Int integer)))
  (and (= temp___loop_entry_208 a)
  (exists ((left1 Int))
  (and (= left1 (- space 1))
  (and
  (exists ((o Bool))
  (exists ((o1 Bool))
  (and
  (exists ((o2 Bool))
  (and
  (exists ((o3 Bool))
  (and
  (exists ((o4 Bool))
  (and
  (exists ((o5 Bool))
  (and
  (ite (= (mod2 8 space) 0) (= o5 (ite (<= (* 2 space) 8) true false))
  (= o5 false))
  (ite (= o5 true)
  (let ((o6 (+ left1 space)))
  (let ((o7 (is_even o6)))
  (and (= (= o7 true) (= (mod2 o6 2) 0)) (= o4 (ite (= o7 true) false true)))))
  (= o4 false))))
  (ite (= o4 true) (= o3 (ite (< left1 space) true false)) (= o3 false))))
  (ite (= o3 true) (= o2 (ite (= (mod2 (+ left1 1) space) 0) true false))
  (= o2 false))))
  (ite (= o2 true)
  (= o1 (ite (forall ((k Int))
             (=> (and (<= 0 k) (<= k 7))
             (let ((temp___206 (to_rep (select a k))))
             (and (<= (- (* 268435455 space)) temp___206)
             (<= temp___206 (* 268435455 space))))))
        true false))
  (= o1 false))))
  (ite (= o1 true)
  (= o (ite (forall ((k Int))
            (=> (and (<= 0 k) (<= k 7))
            (=> (= (is_even k) true)
            (= (to_rep (select a k)) (to_rep
                                     (select temp___loop_entry_207 k))))))
       true false))
  (= o false)))))
  (exists ((a3 (Array Int integer)) (space2 Int) (left2 Int) (right1 Int))
  (and
  (and
  (and
  (and
  (and
  (and
  (and (and (= (mod2 8 space2) 0) (<= (* 2 space2) 8))
  (not (= (is_even (+ left2 space2)) true))) (< left2 space2))
  (= (mod2 (+ left2 1) space2) 0))
  (forall ((k Int))
  (=> (and (<= 0 k) (<= k 7))
  (let ((temp___209 (to_rep (select a3 k))))
  (and (<= (- (* 268435455 space2)) temp___209)
  (<= temp___209 (* 268435455 space2)))))))
  (forall ((k Int))
  (=> (and (<= 0 k) (<= k 7))
  (=> (= (is_even k) true)
  (= (to_rep (select a3 k)) (to_rep (select temp___loop_entry_207 k)))))))
  (forall ((k Int))
  (=> (and (<= 0 k) (<= k 7))
  (=> (= (mod2 (+ k 1) space2) 0)
  (= (to_rep (select a3 k)) (summation temp___loop_entry_208
                            (- (+ k 1) space2) k))))))
  (and
  (and
  (and (dynamic_invariant1 space2 true true true true) (dynamic_invariant
  left2 false true true true)) (dynamic_invariant right1 false true true
  true))
  (exists ((temp___210 Int))
  (and (= temp___210 space2)
  (exists ((left3 Int))
  (and
  (let ((o (+ left2 space2)))
  (and (in_range1 o)
  (ite (< o 8)
  (exists ((temp___loop_entry_194 (Array Int integer)))
  (and (= temp___loop_entry_194 a3)
  (and
  (exists ((o1 Bool))
  (and
  (exists ((o2 Bool))
  (and
  (exists ((o3 Bool))
  (and
  (exists ((o4 Bool))
  (and
  (exists ((o5 Bool))
  (and
  (exists ((o6 Bool))
  (and
  (exists ((o7 Bool))
  (and
  (exists ((o8 Bool))
  (and
  (ite (< (+ left2 space2) 8) (= o8 (ite (= (mod2 8 space2) 0) true false))
  (= o8 false))
  (ite (= o8 true) (= o7 (ite (<= (* 2 space2) 8) true false)) (= o7 false))))
  (ite (= o7 true)
  (let ((o8 (+ left2 space2)))
  (let ((o9 (is_even o8)))
  (and (= (= o9 true) (= (mod2 o8 2) 0)) (= o6 (ite (= o9 true) false true)))))
  (= o6 false))))
  (ite (= o6 true) (= o5 (ite (= (mod2 (+ left2 1) space2) 0) true false))
  (= o5 false))))
  (ite (= o5 true)
  (= o4 (ite (forall ((k Int))
             (=> (and (<= 0 k) (<= k 7))
             (ite (< k left2)
             (let ((temp___192 (to_rep (select a3 k))))
             (and (<= (- (* (* 268435455 space2) 2)) temp___192)
             (<= temp___192 (* (* 268435455 space2) 2))))
             (let ((temp___193 (to_rep (select a3 k))))
             (and (<= (- (* 268435455 space2)) temp___193)
             (<= temp___193 (* 268435455 space2)))))))
        true false))
  (= o4 false))))
  (ite (= o4 true)
  (= o3 (ite (forall ((k Int))
             (=> (and (<= 0 k) (<= k 7))
             (=> (= (is_even k) true)
             (= (to_rep (select a3 k)) (to_rep
                                       (select temp___loop_entry_194 k))))))
        true false))
  (= o3 false))))
  (ite (= o3 true)
  (= o2 (ite (forall ((k Int))
             (=> (and (<= 0 k) (<= k 7))
             (ite (and (< k left2) (= (mod2 (+ k 1) (* space2 2)) 0))
             (= (to_rep (select a3 k)) (summation a_old
                                       (- (+ k 1) (* space2 2)) k))
             (=> (and (<= left2 k) (= (mod2 (+ k 1) space2) 0))
             (= (to_rep (select a3 k)) (summation a_old (- (+ k 1) space2) k))))))
        true false))
  (= o2 false))))
  (ite (= o2 true)
  (and (in_range4 left2)
  (let ((o3 (- (+ left2 1) space2)))
  (and (in_range4 o3)
  (let ((o4 a_old))
  (let ((o5 (summation o4 o3 left2)))
  (and
  (and (dynamic_invariant2 o5 true false true true)
  (=> (= o3 left2) (= o5 (to_rep (select o4 o3)))))
  (and (and (<= 0 left2) (<= left2 7))
  (exists ((o6 Int))
  (and (= (to_rep (select a3 left2)) o6) (= o1 (ite (= o6 o5) true false)))))))))))
  (= o1 false))))
  (or (not (= o1 true))
  (let ((o2 (+ left2 space2)))
  (and (in_range4 o2)
  (let ((o3 (+ left2 1)))
  (and (in_range4 o3)
  (let ((o4 a_old))
  (let ((o5 (summation o4 o3 o2)))
  (and
  (and (dynamic_invariant2 o5 true false true true)
  (=> (= o3 o2) (= o5 (to_rep (select o4 o3)))))
  (let ((temp___195 (+ left2 space2)))
  (and (and (<= 0 temp___195) (<= temp___195 7))
  (exists ((o6 Int)) (= (to_rep (select a3 temp___195)) o6))))))))))))))
  (exists ((a4 (Array Int integer)) (left4 Int) (right2 Int))
  (and
  (and
  (and
  (and
  (and
  (and
  (and
  (and
  (and (and (< (+ left4 space2) 8) (= (mod2 8 space2) 0))
  (<= (* 2 space2) 8)) (not (= (is_even (+ left4 space2)) true)))
  (= (mod2 (+ left4 1) space2) 0))
  (forall ((k Int))
  (=> (and (<= 0 k) (<= k 7))
  (ite (< k left4)
  (let ((temp___196 (to_rep (select a4 k))))
  (and (<= (- (* (* 268435455 space2) 2)) temp___196)
  (<= temp___196 (* (* 268435455 space2) 2))))
  (let ((temp___197 (to_rep (select a4 k))))
  (and (<= (- (* 268435455 space2)) temp___197)
  (<= temp___197 (* 268435455 space2))))))))
  (forall ((k Int))
  (=> (and (<= 0 k) (<= k 7))
  (=> (= (is_even k) true)
  (= (to_rep (select a4 k)) (to_rep (select temp___loop_entry_194 k)))))))
  (forall ((k Int))
  (=> (and (<= 0 k) (<= k 7))
  (ite (and (< k left4) (= (mod2 (+ k 1) (* space2 2)) 0))
  (= (to_rep (select a4 k)) (summation a_old (- (+ k 1) (* space2 2)) k))
  (=> (and (<= left4 k) (= (mod2 (+ k 1) space2) 0))
  (= (to_rep (select a4 k)) (summation a_old (- (+ k 1) space2) k)))))))
  (= (to_rep (select a4 left4)) (summation a_old (- (+ left4 1) space2)
                                left4)))
  (= (to_rep (select a4 (+ left4 space2))) (summation a_old (+ left4 1)
                                           (+ left4 space2))))
  (and
  (= (and (ite (and (dynamic_invariant left4 false true true true)
               (dynamic_invariant right2 false true true true))
          true false) (ite (< (+ left4 space2) 8) true false)) true)
  (exists ((temp___198 Int))
  (and (= temp___198 left4)
  (let ((o1 (+ left4 space2)))
  (and (in_range1 o1)
  (exists ((right3 Int))
  (and (= right3 o1)
  (and (and (<= 0 right3) (<= right3 7))
  (exists ((o2 Int))
  (and (= (to_rep (select a4 right3)) o2)
  (and (and (<= 0 left4) (<= left4 7))
  (exists ((o3 Int))
  (and (= (to_rep (select a4 left4)) o3)
  (let ((o4 (+ o3 o2)))
  (and (in_range1 o4)
  (exists ((o5 integer))
  (and (= (to_rep o5) o4)
  (and (and (<= 0 right3) (<= right3 7))
  (and (= a2 (store a4 right3 o5))
  (let ((o6 (* space2 2)))
  (and (in_range1 o6)
  (let ((o7 (+ left4 o6)))
  (and (in_range1 o7)
  (and (in_range2 o7)
  (and (= left3 o7)
  (let ((o8 (+ left3 space2))) (and (in_range1 o8) (not (< o8 8))))))))))))))))))))))))))))))))))
  (and (= a2 a3) (= left3 left2)))))
  (let ((o (* space2 2)))
  (and (in_range1 o)
  (and (in_range3 o) (and (= space1 o) (not (< space1 8))))))))))))))))))))
  (and (= a2 a) (= space1 space))))

(declare-const k Int)

;; H
  (assert (<= 0 k))

;; H
  (assert (<= k 7))

;; H
  (assert (= (is_even k) true))

(assert
;; defqtvc
 ;; File "prefixsum_general.ads", line 15, characters 0-0
  (not (= (to_rep (select a2 k)) (to_rep (select a1 k)))))
(check-sat)
