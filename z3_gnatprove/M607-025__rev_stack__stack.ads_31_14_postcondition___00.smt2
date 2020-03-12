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

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

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
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(declare-sort r1 0)

(declare-fun r1qtint (r1) Int)

;; r1'axiom
  (assert (forall ((i r1)) (and (<= 0 (r1qtint i)) (<= (r1qtint i) 100))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (r1 r1) Bool)

(declare-const dummy2 r1)

(declare-datatypes () ((r1__ref (r1__refqtmk (r1__content r1)))))
(define-fun r1__ref_r1__content__projection ((a r1__ref)) r1 (r1__content a))

(define-fun to_rep1 ((x r1)) Int (r1qtint x))

(declare-fun of_rep1 (Int) r1)

;; inversion_axiom
  (assert
  (forall ((x r1)) (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x r1)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

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

(declare-const dummy3 (Array Int integer))

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

(declare-fun user_eq3 ((Array Int integer) (Array Int integer)) Bool)

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__stack__stack__top r1)(rec__stack__stack__content (Array Int integer))))))
(define-fun us_split_fields_rec__stack__stack__top__projection ((a us_split_fields)) r1 
  (rec__stack__stack__top a))

(define-fun us_split_fields_rec__stack__stack__content__projection ((a us_split_fields)) (Array Int integer) 
  (rec__stack__stack__content a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq1 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep1
                           (rec__stack__stack__top (us_split_fields1 a))) 
                        (to_rep1
                        (rec__stack__stack__top (us_split_fields1 b))))
                        (= (bool_eq
                           (rec__stack__stack__content (us_split_fields1 a))
                           1 100
                           (rec__stack__stack__content (us_split_fields1 b))
                           1 100) true))
                   true false))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const stack__stack__top__first__bit Int)

(declare-const stack__stack__top__last__bit Int)

(declare-const stack__stack__top__position Int)

;; stack__stack__top__first__bit_axiom
  (assert (<= 0 stack__stack__top__first__bit))

;; stack__stack__top__last__bit_axiom
  (assert (< stack__stack__top__first__bit stack__stack__top__last__bit))

;; stack__stack__top__position_axiom
  (assert (<= 0 stack__stack__top__position))

(declare-const stack__stack__content__first__bit Int)

(declare-const stack__stack__content__last__bit Int)

(declare-const stack__stack__content__position Int)

;; stack__stack__content__first__bit_axiom
  (assert (<= 0 stack__stack__content__first__bit))

;; stack__stack__content__last__bit_axiom
  (assert
  (< stack__stack__content__first__bit stack__stack__content__last__bit))

;; stack__stack__content__position_axiom
  (assert (<= 0 stack__stack__content__position))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ()
((stack__ref (stack__refqtmk (stack__content us_rep)))))
(define-fun stack__ref_stack__content__projection ((a stack__ref)) us_rep 
  (stack__content a))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range f)
     (=> (in_range l)
     (and (= (to_rep (first (mk f l))) f) (= (to_rep (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range low)
                   (and (in_range high)
                   (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int integer))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int integer) (elts a))

(define-fun of_array ((a (Array Int integer)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length1 ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                   (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const component__size1 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; component__size_axiom
  (assert (<= 0 component__size1))

;; alignment_axiom
  (assert (<= 0 alignment2))

(define-fun bool_eq2 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep (first (rt x)))
                 (to_rep (last (rt x))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y)))))

(declare-fun user_eq5 (us_t us_t) Bool)

(declare-const dummy5 us_t)

(declare-datatypes () ((m__ref (m__refqtmk (m__content us_t)))))
(define-fun m__ref_m__content__projection ((a m__ref)) us_t (m__content a))

(declare-fun to__ (us_rep) us_t)

(declare-fun to____function_guard (us_t us_rep) Bool)

(define-fun dynamic_invariant1 ((temp___expr_196 us_t)
  (temp___is_init_192 Bool) (temp___skip_constant_193 Bool)
  (temp___do_toplevel_194 Bool)
  (temp___do_typ_inv_195 Bool)) Bool (=>
                                     (not (= temp___skip_constant_193 true))
                                     (dynamic_property 1 2147483647
                                     (first1 temp___expr_196)
                                     (last1 temp___expr_196))))

(declare-sort t1 0)

(declare-fun first2 (t1) integer)

(declare-fun last2 (t1) integer)

(declare-fun mk1 (Int Int) t1)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range f)
     (=> (in_range l)
     (and (= (to_rep (first2 (mk1 f l))) f) (= (to_rep (last2 (mk1 f l))) l)))) :pattern (
  (mk1 f l)) )))

(define-fun dynamic_property1 ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range low)
                   (and (in_range high)
                   (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes ()
((us_t1 (us_tqtmk1 (elts1 (Array Int integer))(rt1 t1)))))
(define-fun to_array1 ((a us_t1)) (Array Int integer) (elts1 a))

(define-fun of_array1 ((a (Array Int integer)) (f Int)
  (l Int)) us_t1 (us_tqtmk1 a (mk1 f l)))

(define-fun first3 ((a us_t1)) Int (to_rep (first2 (rt1 a))))

(define-fun last3 ((a us_t1)) Int (to_rep (last2 (rt1 a))))

(define-fun length2 ((a us_t1)) Int (ite (<= (first3 a) (last3 a))
                                    (+ (- (last3 a) (first3 a)) 1) 0))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const component__size2 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; component__size_axiom
  (assert (<= 0 component__size2))

;; alignment_axiom
  (assert (<= 0 alignment3))

(define-fun bool_eq3 ((x us_t1)
  (y us_t1)) Bool (bool_eq (elts1 x) (to_rep (first2 (rt1 x)))
                  (to_rep (last2 (rt1 x))) (elts1 y)
                  (to_rep (first2 (rt1 y))) (to_rep (last2 (rt1 y)))))

(declare-fun user_eq6 (us_t1 us_t1) Bool)

(declare-const dummy6 us_t1)

(declare-datatypes ()
((intarray__ref (intarray__refqtmk (intarray__content us_t1)))))
(define-fun intarray__ref_intarray__content__projection ((a intarray__ref)) us_t1 
  (intarray__content a))

(declare-datatypes () ((t5b__ref (t5b__refqtmk (t5b__content us_t1)))))
(define-fun t5b__ref_t5b__content__projection ((a t5b__ref)) us_t1 (t5b__content
                                                                   a))

;; to____post_axiom
  (assert
  (forall ((s us_rep))
  (! (let ((result (to__ s)))
     (=> (to____function_guard result s)
     (and (and (= (first1 result) 1) (<= 0 (last1 result)))
     (dynamic_invariant1 result true false true true)))) :pattern ((to__ s)) )))

;; to____def_axiom
  (assert
  (forall ((s us_rep))
  (! (= (to__ s) (let ((temp___209 (let ((temp___207 (to_rep1
                                                     (rec__stack__stack__top
                                                     (us_split_fields1 s)))))
                                   (let ((temp___206 1))
                                   (let ((temp___208 (rec__stack__stack__content
                                                     (us_split_fields1 s))))
                                   (of_array1 temp___208 temp___206
                                   temp___207))))))
                 (of_array (to_array1 temp___209) (first3 temp___209)
                 (last3 temp___209)))) :pattern ((to__ s)) )))

(declare-fun is_full (us_rep) Bool)

(declare-fun is_full__function_guard (Bool us_rep) Bool)

;; is_full__post_axiom
  (assert true)

;; is_full__def_axiom
  (assert
  (forall ((s us_rep))
  (! (and (forall ((s1 us_rep)) (to____function_guard (to__ s1) s1))
     (= (= (is_full s) true) (<= 100 (last1 (to__ s))))) :pattern ((is_full
                                                                   s)) )))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-fun concat1 ((Array Int integer) Int Int (Array Int integer) Int
  Int) (Array Int integer))

;; concat_def
  (assert
  (forall ((a (Array Int integer)) (b (Array Int integer)))
  (forall ((a_first Int) (a_last Int) (b_first Int) (b_last Int))
  (forall ((i Int))
  (! (and
     (=> (and (<= a_first i) (<= i a_last))
     (= (select (concat1 a a_first a_last b b_first b_last) i) (select a i)))
     (=> (< a_last i)
     (= (select (concat1 a a_first a_last b b_first b_last) i) (select b (+ (- i a_last) (- b_first 1)))))) :pattern ((select 
  (concat1 a a_first a_last b b_first b_last) i)) )))))

(declare-fun concat_singleton_left (integer Int (Array Int integer) Int
  Int) (Array Int integer))

;; concat_singleton_left_def
  (assert
  (forall ((a integer))
  (forall ((b (Array Int integer)))
  (forall ((a_first Int) (b_first Int) (b_last Int))
  (! (and
     (= (select (concat_singleton_left a a_first b b_first b_last) a_first) a)
     (forall ((i Int))
     (! (=> (< a_first i)
        (= (select (concat_singleton_left a a_first b b_first b_last) i) (select b (+ (- i a_first) (- b_first 1))))) :pattern ((select 
     (concat_singleton_left a a_first b b_first b_last) i)) ))) :pattern (
  (concat_singleton_left a a_first b b_first b_last)) )))))

(declare-fun concat_singleton_right ((Array Int integer) Int Int
  integer) (Array Int integer))

;; concat_singleton_right_def
  (assert
  (forall ((a (Array Int integer)))
  (forall ((b integer))
  (forall ((a_first Int) (a_last Int))
  (! (and
     (= (select (concat_singleton_right a a_first a_last b) (+ a_last 1)) b)
     (forall ((i Int))
     (! (=> (and (<= a_first i) (<= i a_last))
        (= (select (concat_singleton_right a a_first a_last b) i) (select a i))) :pattern ((select 
     (concat_singleton_right a a_first a_last b) i)) :pattern ((select a i)) ))) :pattern (
  (concat_singleton_right a a_first a_last b)) )))))

(declare-fun concat_singletons (integer Int integer) (Array Int integer))

;; concat_singletons_def
  (assert
  (forall ((a integer) (b integer))
  (forall ((a_first Int))
  (! (and (= (select (concat_singletons a a_first b) a_first) a)
     (= (select (concat_singletons a a_first b) (+ a_first 1)) b)) :pattern (
  (concat_singletons a a_first b)) ))))

(declare-fun singleton1 (integer Int) (Array Int integer))

;; singleton_def
  (assert
  (forall ((v integer))
  (forall ((i Int))
  (! (= (select (singleton1 v i) i) v) :pattern ((select (singleton1 v i) i)) ))))

(declare-sort r2 0)

(declare-fun r2qtint (r2) Int)

;; r2'axiom
  (assert (forall ((i r2)) (and (<= 1 (r2qtint i)) (<= (r2qtint i) 100))))

(define-fun in_range3 ((x1 Int)) Bool (and (<= 1 x1) (<= x1 100)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq7 (r2 r2) Bool)

(declare-const dummy7 r2)

(declare-datatypes () ((r2__ref (r2__refqtmk (r2__content r2)))))
(define-fun r2__ref_r2__content__projection ((a r2__ref)) r2 (r2__content a))

(declare-sort t11s 0)

(declare-fun t11sqtint (t11s) Int)

;; t11s'axiom
  (assert
  (forall ((i t11s)) (and (<= 1 (t11sqtint i)) (<= (t11sqtint i) 1))))

(define-fun in_range4 ((x1 Int)) Bool (and (<= 1 x1) (<= x1 1)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq8 (t11s t11s) Bool)

(declare-const dummy8 t11s)

(declare-datatypes () ((t11s__ref (t11s__refqtmk (t11s__content t11s)))))
(define-fun t11s__ref_t11s__content__projection ((a t11s__ref)) t11s 
  (t11s__content a))

(declare-fun temp_____aggregate_def_237 (Int) (Array Int integer))

(define-fun dynamic_invariant2 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range1
                                    temp___expr_46)))

;; def_axiom
  (assert
  (forall ((temp___239 Int))
  (=> (dynamic_invariant temp___239 true true true true)
  (= (to_rep (select (temp_____aggregate_def_237 temp___239) 1)) temp___239))))

(define-fun dynamic_invariant3 ((temp___expr_164 Int)
  (temp___is_init_160 Bool) (temp___skip_constant_161 Bool)
  (temp___do_toplevel_162 Bool)
  (temp___do_typ_inv_163 Bool)) Bool (=>
                                     (or (= temp___is_init_160 true)
                                     (<= 0 100)) (in_range2 temp___expr_164)))

(define-fun dynamic_invariant4 ((temp___expr_177 Int)
  (temp___is_init_173 Bool) (temp___skip_constant_174 Bool)
  (temp___do_toplevel_175 Bool)
  (temp___do_typ_inv_176 Bool)) Bool (=>
                                     (or (= temp___is_init_173 true)
                                     (<= 1 100)) (in_range3 temp___expr_177)))

(declare-const s__split_fields us_split_fields)

(declare-const s__split_fields1 us_split_fields)

;; H
  (assert (= s__split_fields1 s__split_fields))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant x true false true true))

;; H
  (assert
  (forall ((s__split_fields2 us_split_fields)) (is_full__function_guard
  (is_full (us_repqtmk s__split_fields2)) (us_repqtmk s__split_fields2))))

;; Assume
  (assert (not (= (is_full (us_repqtmk s__split_fields)) true)))

;; H
  (assert
  (forall ((s__split_fields2 us_split_fields)) (to____function_guard
  (to__ (us_repqtmk s__split_fields2)) (us_repqtmk s__split_fields2))))

(define-fun usf () us_t (to__ (us_repqtmk s__split_fields)))

(declare-const o Int)

;; Ensures
  (assert (= (to_rep1 (rec__stack__stack__top s__split_fields)) o))

(define-fun o1 () Int (+ o 1))

;; Ensures
  (assert (in_range2 o1))

(declare-const o2 r1)

;; Ensures
  (assert (= (to_rep1 o2) o1))

(declare-const s__split_fields2 us_split_fields)

;; H
  (assert
  (= s__split_fields2 (us_split_fieldsqtmk o2
                      (rec__stack__stack__content s__split_fields))))

(declare-const o3 integer)

;; Ensures
  (assert (= (to_rep o3) x))

(declare-const temp___296 Int)

;; Ensures
  (assert (= (to_rep1 (rec__stack__stack__top s__split_fields2)) temp___296))

;; Assert
  (assert (and (<= 1 temp___296) (<= temp___296 100)))

(declare-const s__split_fields3 us_split_fields)

;; H
  (assert
  (= s__split_fields3 (us_split_fieldsqtmk
                      (rec__stack__stack__top s__split_fields2)
                      (store (rec__stack__stack__content s__split_fields2) 
                      temp___296 o3))))

;; H
  (assert
  (forall ((s__split_fields4 us_split_fields)) (to____function_guard
  (to__ (us_repqtmk s__split_fields4)) (us_repqtmk s__split_fields4))))

;; H
  (assert
  (forall ((s__split_fields4 us_split_fields)) (to____function_guard
  (to__ (us_repqtmk s__split_fields4)) (us_repqtmk s__split_fields4))))

(assert
;; defqtvc
 ;; File "stack.ads", line 29, characters 0-0
  (not
  (= (let ((temp___316 (let ((temp___312 (temp_____aggregate_def_237 x)))
                       (let ((temp___311 (to__ (us_repqtmk s__split_fields1))))
                       (ite (= (length1 temp___311) 0)
                       (of_array temp___312 1 1)
                       (of_array
                       (concat1 (to_array temp___311) (first1 temp___311)
                       (last1 temp___311) temp___312 1 1) (first1 temp___311)
                       (- (+ (first1 temp___311) (+ (length
                                                    (first1 temp___311)
                                                    (last1 temp___311)) 
                       (length 1 1))) 1)))))))
     (let ((temp___315 (to__ (us_repqtmk s__split_fields3))))
     (bool_eq (to_array temp___315) (first1 temp___315) (last1 temp___315)
     (to_array temp___316) (first1 temp___316) (last1 temp___316)))) true)))
(check-sat)
