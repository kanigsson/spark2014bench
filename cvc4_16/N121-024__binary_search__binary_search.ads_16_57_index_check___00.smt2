(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
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

;; Div_unique
  (assert
  (forall ((x Int) (y Int) (q Int))
  (=> (< 0 y) (=> (and (<= (* q y) x) (< x (+ (* q y) y))) (= (div x y) q)))))

;; Div_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (< 0 y)) (and (<= 0 (div x y)) (<= (div x y) x)))))

;; Div_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (div x y) 0))))

;; Div_inf_neg
  (assert
  (forall ((x Int) (y Int))
  (=> (and (< 0 x) (<= x y)) (= (div (- x) y) (- 1)))))

;; Mod_0
  (assert (forall ((y Int)) (=> (not (= y 0)) (= (mod 0 y) 0))))

;; Div_1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (div 1 y) 0))))

;; Div_minus1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (div (- 1) y) (- 1)))))

;; Mod_1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (mod 1 y) 1))))

;; Mod_minus1_left
  (assert
  (forall ((y Int))
  (! (=> (< 1 y) (= (mod (- 1) y) (- y 1))) :pattern ((mod (- 1) y)) )))

;; Div_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (< 0 x) (= (div (+ (* x y) z) x) (+ y (div z x)))) :pattern ((div (+ (* x y) z) x)) )))

;; Mod_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (< 0 x) (= (mod (+ (* x y) z) x) (mod z x))) :pattern ((mod (+ (* x y) z) x)) )))

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

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

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

(declare-sort topt_indexB 0)

(declare-fun topt_indexBqtint (topt_indexB) Int)

;; topt_indexB'axiom
  (assert
  (forall ((i topt_indexB))
  (and (<= (- 2147483648) (topt_indexBqtint i))
  (<= (topt_indexBqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (topt_indexB topt_indexB) Bool)

(declare-const dummy1 topt_indexB)

(declare-datatypes ((topt_indexB__ref 0))
(((topt_indexB__refqtmk (topt_indexB__content topt_indexB)))))
(define-fun topt_indexB__ref_topt_indexB__content__projection ((a topt_indexB__ref)) topt_indexB 
  (topt_indexB__content a))

(define-fun to_rep1 ((x topt_indexB)) Int (topt_indexBqtint x))

(declare-fun of_rep1 (Int) topt_indexB)

;; inversion_axiom
  (assert
  (forall ((x topt_indexB))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x topt_indexB)) (! (in_range2
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index))
  (and (<= 1 (indexqtint i)) (<= (indexqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (index index) Bool)

(declare-const dummy2 index)

(declare-datatypes ((index__ref 0))
(((index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int integer))))))
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
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep (select a temp___idx_154)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_154)))))))
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
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-sort t 0)

(declare-fun first (t) topt_indexB)

(declare-fun last (t) topt_indexB)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range2 f)
     (=> (in_range2 l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range2 low)
                   (and (in_range2 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int integer))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int integer) (elts a))

(define-fun of_array ((a (Array Int integer)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(define-fun bool_eq1 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep1 (first (rt x)))
                 (to_rep1 (last (rt x))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ((ar__ref 0))
(((ar__refqtmk (ar__content us_t)))))
(define-fun ar__ref_ar__content__projection ((a ar__ref)) us_t (ar__content
                                                               a))

(declare-fun empty (us_t) Bool)

(declare-fun empty__function_guard (Bool us_t) Bool)

(define-fun dynamic_invariant1 ((temp___expr_176 us_t)
  (temp___is_init_172 Bool) (temp___skip_constant_173 Bool)
  (temp___do_toplevel_174 Bool)
  (temp___do_typ_inv_175 Bool)) Bool (=>
                                     (not (= temp___skip_constant_173 true))
                                     (dynamic_property 1 2147483647
                                     (first1 temp___expr_176)
                                     (last1 temp___expr_176))))

;; empty__post_axiom
  (assert true)

;; empty__def_axiom
  (assert
  (forall ((a us_t))
  (! (= (= (empty a) true) (< (last1 a) (first1 a))) :pattern ((empty a)) )))

(declare-fun sorted (us_t) Bool)

(declare-fun sorted__function_guard (Bool us_t) Bool)

;; sorted__post_axiom
  (assert true)

;; sorted__def_axiom
  (assert
  (forall ((a us_t))
  (! (= (= (sorted a) true)
     (forall ((i1 Int))
     (=> (and (<= (first1 a) i1) (<= i1 (last1 a)))
     (forall ((i2 Int))
     (=> (and (<= i1 i2) (<= i2 (last1 a)))
     (<= (to_rep (select (to_array a) i1)) (to_rep (select (to_array a) i2)))))))) :pattern (
  (sorted a)) )))

(declare-const a us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const i Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(define-fun dynamic_invariant2 ((temp___expr_169 Int)
  (temp___is_init_165 Bool) (temp___skip_constant_166 Bool)
  (temp___do_toplevel_167 Bool)
  (temp___do_typ_inv_168 Bool)) Bool (=>
                                     (or (= temp___is_init_165 true)
                                     (<= 1 2147483647)) (in_range3
                                     temp___expr_169)))

(assert
;; defqtvc
 ;; File "binary_search.ads", line 14, characters 0-0
  (not
  (forall ((left Int) (right Int) (med Int)
  (binary_search__search__result Int))
  (=> (dynamic_invariant1 a true false true true)
  (=> (dynamic_invariant i true false true true)
  (=> (sorted__function_guard (sorted a) a)
  (=> (= (sorted a) true)
  (=> (dynamic_invariant2 left false false true true)
  (=> (dynamic_invariant2 right false false true true)
  (=> (dynamic_invariant2 med false false true true)
  (=>
  (let ((o a))
  (let ((o1 (empty o)))
  (and
  (and (empty__function_guard o1 o) (= (= o1 true) (< (last1 o) (first1 o))))
  (exists ((spark__branch Bool))
  (and (= spark__branch o1)
  (ite (= spark__branch true) (= binary_search__search__result 0)
  (let ((o2 (first1 a)))
  (and (in_range3 o2)
  (exists ((left1 Int))
  (and (= left1 o2)
  (let ((o3 (last1 a)))
  (and (in_range3 o3)
  (exists ((right1 Int))
  (and (= right1 o3)
  (and (and (<= (first1 a) left1) (<= left1 (last1 a)))
  (exists ((o4 Int))
  (and (= (to_rep (select (to_array a) left1)) o4)
  (exists ((spark__branch1 Bool))
  (and
  (= spark__branch1 (and (ite (= left1 right1) true false) (ite (= o4 
                                                           i) true false)))
  (ite (= spark__branch1 true) (= binary_search__search__result left1)
  (and (and (<= (first1 a) right1) (<= right1 (last1 a)))
  (exists ((o5 Int))
  (and (= (to_rep (select (to_array a) right1)) o5)
  (and (and (<= (first1 a) left1) (<= left1 (last1 a)))
  (exists ((o6 Int))
  (and (= (to_rep (select (to_array a) left1)) o6)
  (exists ((spark__branch2 Bool))
  (and
  (= spark__branch2 (or (ite (< i o6) true false) (ite (< o5 i) true false)))
  (ite (= spark__branch2 true) (= binary_search__search__result 0)
  (or
  (and (< left1 right1)
  (exists ((left2 Int) (right2 Int) (med1 Int))
  (and
  (and (and (<= (first1 a) left2) (<= left2 (last1 a)))
  (and (<= (first1 a) right2) (<= right2 (last1 a))))
  (and
  (= (and (ite (and
               (and (dynamic_invariant2 right2 false true true true)
               (dynamic_invariant2 med1 false true true true))
               (dynamic_invariant2 left2 false true true true))
          true false) (ite (< left2 right2) true false)) true)
  (exists ((temp___203 Int))
  (and (= temp___203 (- right2 left2))
  (let ((o7 (+ left2 (div1 (- right2 left2) 2))))
  (and (in_range2 o7)
  (and (in_range3 o7)
  (exists ((med2 Int))
  (and (= med2 o7)
  (and (and (<= (first1 a) med2) (<= med2 (last1 a)))
  (exists ((o8 Int))
  (and (= (to_rep (select (to_array a) med2)) o8)
  (exists ((spark__branch3 Bool))
  (and (= spark__branch3 (ite (< o8 i) true false))
  (and (not (= spark__branch3 true))
  (and (and (<= (first1 a) med2) (<= med2 (last1 a)))
  (exists ((o9 Int))
  (and (= (to_rep (select (to_array a) med2)) o9)
  (exists ((spark__branch4 Bool))
  (and (= spark__branch4 (ite (< i o9) true false))
  (and (not (= spark__branch4 true)) (= binary_search__search__result med2))))))))))))))))))))))))
  (and
  (or (not (< left1 right1))
  (exists ((left2 Int) (right2 Int) (med1 Int))
  (and
  (and (and (<= (first1 a) left2) (<= left2 (last1 a)))
  (and (<= (first1 a) right2) (<= right2 (last1 a))))
  (and
  (= (and (ite (and
               (and (dynamic_invariant2 right2 false true true true)
               (dynamic_invariant2 med1 false true true true))
               (dynamic_invariant2 left2 false true true true))
          true false) (ite (< left2 right2) true false)) true)
  (exists ((temp___203 Int))
  (and (= temp___203 (- right2 left2))
  (let ((o7 (+ left2 (div1 (- right2 left2) 2))))
  (and (in_range2 o7)
  (and (in_range3 o7)
  (exists ((med2 Int))
  (and (= med2 o7)
  (exists ((left3 Int) (right3 Int))
  (and
  (and (and (<= (first1 a) med2) (<= med2 (last1 a)))
  (exists ((o8 Int))
  (and (= (to_rep (select (to_array a) med2)) o8)
  (exists ((spark__branch3 Bool))
  (and (= spark__branch3 (ite (< o8 i) true false))
  (ite (= spark__branch3 true)
  (and (let ((o9 (+ med2 1))) (and (in_range2 o9) (= left3 o9)))
  (= right3 right2))
  (and
  (and (and (<= (first1 a) med2) (<= med2 (last1 a)))
  (exists ((o9 Int))
  (and (= (to_rep (select (to_array a) med2)) o9)
  (exists ((spark__branch4 Bool))
  (and (= spark__branch4 (ite (< i o9) true false))
  (and (= spark__branch4 true)
  (let ((o10 (- med2 1))) (and (in_range3 o10) (= right3 o10)))))))))
  (= left3 left2)))))))) (not (< left3 right3)))))))))))))))
  (= binary_search__search__result 0))))))))))))))))))))))))))))))))
  (=>
  (= (and (ite (<= (first1 a) binary_search__search__result) true false) 
  (ite (<= binary_search__search__result (last1 a)) true false)) true)
  (<= (first1 a) binary_search__search__result)))))))))))))
(check-sat)
(exit)
