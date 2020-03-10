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

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

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

(declare-sort content 0)

(declare-fun contentqtint (content) Int)

;; content'axiom
  (assert
  (forall ((i content))
  (and (<= (- 2147483648) (contentqtint i)) (<= (contentqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (content content) Bool)

(declare-const dummy1 content)

(declare-datatypes ((content__ref 0))
(((content__refqtmk (content__content content)))))
(define-fun content__ref_content__content__projection ((a content__ref)) content 
  (content__content a))

(define-fun to_rep1 ((x content)) Int (contentqtint x))

(declare-fun of_rep1 (Int) content)

;; inversion_axiom
  (assert
  (forall ((x content))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x content)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int content))))))
(declare-fun slide ((Array Int content) Int Int) (Array Int content))

;; slide_eq
  (assert
  (forall ((a (Array Int content)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int content)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int content)) (a__first Int) (a__last Int)
  (b (Array Int content)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_156 Int))
                           (=>
                           (and (<= a__first temp___idx_156)
                           (<= temp___idx_156 a__last))
                           (= (to_rep1 (select a temp___idx_156)) (to_rep1
                                                                  (select b (+ (- b__first a__first) temp___idx_156)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int content)) (b (Array Int content)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_156 Int))
  (=> (and (<= a__first temp___idx_156) (<= temp___idx_156 a__last))
  (= (to_rep1 (select a temp___idx_156)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_156)))))))))))

(declare-const h_v1__first integer)

(declare-const h_v1__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const h_v2__first integer)

(declare-const h_v2__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const i Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const r11b Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const r17b Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(define-fun dynamic_invariant1 ((temp___expr_232 Int)
  (temp___is_init_228 Bool) (temp___skip_constant_229 Bool)
  (temp___do_toplevel_230 Bool)
  (temp___do_typ_inv_231 Bool)) Bool (=>
                                     (or (= temp___is_init_228 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range2 temp___expr_232)))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first (mk f l))) f) (= (to_rep (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int content))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int content) (elts a))

(define-fun of_array ((a (Array Int content)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length1 ((a us_t)) Int (ite (<= (first1 a) (last1 a))
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
  (y us_t)) Bool (bool_eq (elts x) (to_rep (first (rt x)))
                 (to_rep (last (rt x))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y)))))

(declare-fun user_eq2 (us_t us_t) Bool)

(declare-const dummy2 us_t)

(declare-datatypes ((h_type__ref 0))
(((h_type__refqtmk (h_type__content us_t)))))
(define-fun h_type__ref_h_type__content__projection ((a h_type__ref)) us_t 
  (h_type__content a))

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (integer integer) Bool)

(declare-const dummy3 integer)

(declare-datatypes ((t12b__ref 0))
(((t12b__refqtmk (t12b__content integer)))))
(define-fun t12b__ref_t12b__content__projection ((a t12b__ref)) integer 
  (t12b__content a))

(define-fun dynamic_property2 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (integer integer) Bool)

(declare-const dummy4 integer)

(declare-datatypes ((t18b__ref 0))
(((t18b__refqtmk (t18b__content integer)))))
(define-fun t18b__ref_t18b__content__projection ((a t18b__ref)) integer 
  (t18b__content a))

(define-fun dynamic_invariant2 ((temp___expr_239 us_t)
  (temp___is_init_235 Bool) (temp___skip_constant_236 Bool)
  (temp___do_toplevel_237 Bool)
  (temp___do_typ_inv_238 Bool)) Bool (=>
                                     (not (= temp___skip_constant_236 true))
                                     (dynamic_property (- 2147483648)
                                     2147483647 (first1 temp___expr_239)
                                     (last1 temp___expr_239))))

(assert
;; defqtvc
 ;; File "infoflow.ads", line 73, characters 0-0
  (not
  (forall ((h_v1 (Array Int content)) (h_v2 (Array Int content)) (t_v2 Int)
  (m_v2 Int))
  (=> (dynamic_property (- 2147483648) 2147483647 (to_rep h_v1__first)
  (to_rep h_v1__last))
  (=> (dynamic_property (- 2147483648) 2147483647 (to_rep h_v2__first)
  (to_rep h_v2__last))
  (=> (dynamic_invariant i true false true true)
  (forall ((h_v11 (Array Int content)))
  (forall ((h_v21 (Array Int content)))
  (=>
  (and (dynamic_invariant1 t_v2 false false true true)
  (and (dynamic_invariant m_v2 false false true true)
  (exists ((o Int))
  (and (= (to_rep h_v2__last) o)
  (exists ((m_v21 Int))
  (and (= m_v21 (div1 o 2))
  (and (= m_v21 r17b)
  (and (dynamic_invariant r17b true false true true)
  (exists ((temp___440 Int))
  (and (= (to_rep h_v2__first) temp___440)
  (let ((temp___441 r17b))
  (exists ((q_v2 Int))
  (and (= q_v2 temp___440)
  (ite (= (and (ite (<= temp___440 q_v2) true false) (ite (<= q_v2 temp___441)
                                                     true false)) true)
  (exists ((temp___loop_entry_454 (Array Int content)))
  (and (= temp___loop_entry_454 h_v2)
  (exists ((temp___loop_entry_452 (Array Int content)))
  (and (= temp___loop_entry_452 h_v2)
  (exists ((temp___loop_entry_450 (Array Int content)))
  (and (= temp___loop_entry_450 h_v2)
  (and
  (exists ((o1 Int))
  (and (= (to_rep h_v2__last) o1)
  (exists ((o2 Int)) (= (to_rep h_v2__first) o2))))
  (exists ((h_v22 (Array Int content)) (t_v21 Int) (q_v21 Int))
  (and
  (forall ((k Int))
  (=> (and (<= (to_rep h_v2__first) k) (<= k (to_rep h_v2__last)))
  (ite (< k q_v21)
  (= (to_rep1 (select h_v22 k)) (to_rep1
                                (select temp___loop_entry_450 (+ k m_v21))))
  (ite (< (+ q_v21 m_v21) k)
  (= (to_rep1 (select h_v22 k)) (to_rep1
                                (select temp___loop_entry_452 (- k m_v21))))
  (= (to_rep1 (select h_v22 k)) (to_rep1 (select temp___loop_entry_454 k)))))))
  (and
  (= (and (ite (and (dynamic_property2 (to_rep h_v2__first) r17b q_v21)
               (dynamic_invariant1 t_v21 false true true true))
          true false) (ite (and (<= (to_rep h_v2__first) q_v21)
                           (<= q_v21 r17b))
                      true false)) true)
  (and (and (<= (to_rep h_v2__first) q_v21) (<= q_v21 (to_rep h_v2__last)))
  (exists ((o1 Int))
  (and (= (to_rep1 (select h_v22 q_v21)) o1)
  (exists ((t_v22 Int))
  (and (= t_v22 o1)
  (let ((o2 (+ q_v21 m_v21)))
  (and (in_range1 o2)
  (and (and (<= (to_rep h_v2__first) o2) (<= o2 (to_rep h_v2__last)))
  (exists ((o3 Int))
  (and (= (to_rep1 (select h_v22 o2)) o3)
  (exists ((o4 content))
  (and (= (to_rep1 o4) o3)
  (and (and (<= (to_rep h_v2__first) q_v21) (<= q_v21 (to_rep h_v2__last)))
  (exists ((h_v23 (Array Int content)))
  (and (= h_v23 (store h_v22 q_v21 o4))
  (exists ((o5 content))
  (and (= (to_rep1 o5) t_v22)
  (let ((o6 (+ q_v21 m_v21)))
  (and (in_range1 o6)
  (and (and (<= (to_rep h_v2__first) o6) (<= o6 (to_rep h_v2__last)))
  (and (= h_v21 (store h_v23 o6 o5)) (= q_v21 temp___441))))))))))))))))))))))))))))))))
  (= h_v21 h_v2)))))))))))))))
  (=>
  (=>
  (= (and (and (and (and (and (and (ite (<= (to_rep h_v1__first) i) true
                                   false) (ite (<= i (to_rep h_v1__last))
                                          true false)) (= (to_rep
                                                          h_v1__first) 1)) (= 
  (to_rep h_v2__first) 1)) (= (to_rep h_v1__last) (to_rep h_v2__last))) (<= 
  i (div1 (to_rep h_v1__last) 2))) (= (to_rep1
                                      (select h_v1 (+ i (div1
                                                        (to_rep h_v1__last)
                                                        2)))) (to_rep1
                                                              (select h_v2 (+ 
                                                              i (div1
                                                                (to_rep
                                                                h_v2__last)
                                                                2)))))) true)
  (= (to_rep1 (select h_v11 i)) (to_rep1 (select h_v21 i))))
  (=>
  (= (and (and (and (and (and (and (ite (<= (to_rep h_v1__first) i) true
                                   false) (ite (<= i (to_rep h_v1__last))
                                          true false)) (= (to_rep
                                                          h_v1__first) 1)) (= 
  (to_rep h_v2__first) 1)) (= (to_rep h_v1__last) (to_rep h_v2__last))) (> 
  i (div1 (to_rep h_v1__last) 2))) (= (to_rep1
                                      (select h_v1 (- i (div1
                                                        (to_rep h_v1__last)
                                                        2)))) (to_rep1
                                                              (select h_v2 (- 
                                                              i (div1
                                                                (to_rep
                                                                h_v2__last)
                                                                2)))))) true)
  (= (to_rep1 (select h_v11 i)) (to_rep1 (select h_v21 i))))))))))))))
(check-sat)
(exit)
