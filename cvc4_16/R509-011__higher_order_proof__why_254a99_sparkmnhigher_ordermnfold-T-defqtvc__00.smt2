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

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

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

(declare-const first Int)

(declare-const last Int)

(define-fun dynamic_property ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (integer integer) Bool)

(declare-const dummy1 integer)

(declare-datatypes ((my_index__ref 0))
(((my_index__refqtmk (my_index__content integer)))))
(define-fun my_index__ref_my_index__content__projection ((a my_index__ref)) integer 
  (my_index__content a))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int integer))))))
(declare-fun slide ((Array Int integer) Int Int) (Array Int integer))

;; slide_eq
  (assert
  (forall ((a (Array Int integer)))
  (forall ((first1 Int))
  (! (= (slide a first1 first1) a) :pattern ((slide a first1 first1)) ))))

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
                           (forall ((temp___idx_157 Int))
                           (=>
                           (and (<= a__first temp___idx_157)
                           (<= temp___idx_157 a__last))
                           (= (to_rep (select a temp___idx_157)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_157)))))))
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
  (forall ((temp___idx_157 Int))
  (=> (and (<= a__first temp___idx_157) (<= temp___idx_157 a__last))
  (= (to_rep (select a temp___idx_157)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_157)))))))))))

(declare-sort t 0)

(declare-fun first1 (t) integer)

(declare-fun last1 (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range f)
     (=> (in_range l)
     (and (= (to_rep (first1 (mk f l))) f) (= (to_rep (last1 (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property1 ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range low)
                   (and (in_range high)
                   (=> (<= low high)
                   (and (dynamic_property range_first range_last low)
                   (dynamic_property range_first range_last high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int integer))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int integer) (elts a))

(define-fun of_array ((a (Array Int integer)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first2 ((a us_t)) Int (to_rep (first1 (rt a))))

(define-fun last2 ((a us_t)) Int (to_rep (last1 (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first2 a) (last2 a))
                                  (+ (- (last2 a) (first2 a)) 1) 0))

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
  (y us_t)) Bool (bool_eq (elts x) (to_rep (first1 (rt x)))
                 (to_rep (last1 (rt x))) (elts y) (to_rep (first1 (rt y)))
                 (to_rep (last1 (rt y)))))

(declare-fun user_eq2 (us_t us_t) Bool)

(declare-const dummy2 us_t)

(declare-datatypes ((my_array__ref 0))
(((my_array__refqtmk (my_array__content us_t)))))
(define-fun my_array__ref_my_array__content__projection ((a my_array__ref)) us_t 
  (my_array__content a))

(declare-fun ind_prop (us_t Int Int) Bool)

(declare-fun ind_prop__function_guard (Bool us_t Int Int) Bool)

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(declare-const fst Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const lst Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant1 ((temp___expr_171 Int)
  (temp___is_init_167 Bool) (temp___skip_constant_168 Bool)
  (temp___do_toplevel_169 Bool)
  (temp___do_typ_inv_170 Bool)) Bool (=>
                                     (or (= temp___is_init_167 true)
                                     (<= first last)) (dynamic_property 
                                     first last temp___expr_171)))

;; first__def_axiom
  (assert (= first fst))

;; last__def_axiom
  (assert (= last lst))

(define-fun dynamic_invariant2 ((temp___expr_178 us_t)
  (temp___is_init_174 Bool) (temp___skip_constant_175 Bool)
  (temp___do_toplevel_176 Bool)
  (temp___do_typ_inv_177 Bool)) Bool (=>
                                     (not (= temp___skip_constant_175 true))
                                     (dynamic_property1 first last
                                     (first2 temp___expr_178)
                                     (last2 temp___expr_178))))

;; ind_prop__post_axiom
  (assert true)

(declare-fun final_prop (us_t Int) Bool)

(declare-fun final_prop__function_guard (Bool us_t Int) Bool)

;; final_prop__post_axiom
  (assert true)

(declare-fun f (Int Int) Int)

(declare-fun f__function_guard (Int Int Int) Bool)

;; f__post_axiom
  (assert
  (forall ((x Int) (i Int))
  (! (=>
     (and (dynamic_invariant x true true true true) (dynamic_invariant i true
     true true true))
     (let ((result (f x i)))
     (=> (f__function_guard result x i) (dynamic_invariant result true false
     true true)))) :pattern ((f x i)) )))

(declare-datatypes ((array_type__ref 0))
(((array_type__refqtmk (array_type__content us_t)))))
(define-fun array_type__ref_array_type__content__4__projection ((a array_type__ref)) us_t 
  (array_type__content a))

(declare-const a us_t)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort element_out 0)

(declare-fun element_outqtint (element_out) Int)

;; element_out'axiom
  (assert
  (forall ((i element_out))
  (and (<= (- 2147483648) (element_outqtint i))
  (<= (element_outqtint i) 2147483647))))

(define-fun in_range1 ((x1 Int)) Bool (and (<= (- 2147483648) x1)
                                      (<= x1 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq3 (element_out element_out) Bool)

(declare-const dummy3 element_out)

(declare-datatypes ((element_out__ref 0))
(((element_out__refqtmk (element_out__content element_out)))))
(define-fun element_out__ref_element_out__content__4__projection ((a1 element_out__ref)) element_out 
  (element_out__content a1))

(define-fun dynamic_invariant3 ((temp___expr_377 Int)
  (temp___is_init_373 Bool) (temp___skip_constant_374 Bool)
  (temp___do_toplevel_375 Bool)
  (temp___do_typ_inv_376 Bool)) Bool (=>
                                     (or (= temp___is_init_373 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range1 temp___expr_377)))

(define-fun dynamic_invariant4 ((temp___expr_371 us_t)
  (temp___is_init_367 Bool) (temp___skip_constant_368 Bool)
  (temp___do_toplevel_369 Bool)
  (temp___do_typ_inv_370 Bool)) Bool (=>
                                     (not (= temp___skip_constant_368 true))
                                     (dynamic_property1 first last
                                     (first2 temp___expr_371)
                                     (last2 temp___expr_371))))

(declare-fun id (Int) Int)

(declare-fun id__function_guard (Int Int) Bool)

;; id__post_axiom
  (assert
  (forall ((x1 Int))
  (! (=> (dynamic_invariant x1 true true true true)
     (let ((result (id x1)))
     (=> (id__function_guard result x1) (dynamic_invariant result true false
     true true)))) :pattern ((id x1)) )))

;; fst__def_axiom
  (assert (and (id__function_guard (id 0) 0) (= fst (id 0))))

;; lst__def_axiom
  (assert (and (id__function_guard (id 100) 100) (= lst (id 100))))

(assert
;; defqtvc
 ;; File "spark-higher_order-fold.ads", line 60, characters 0-0
  (not
  (=> (dynamic_invariant4 a true false true true)
  (=> (dynamic_invariant3 x true false true true)
  (=> (< 0 (length a))
  (=> (ind_prop__function_guard
  (ind_prop (of_array (to_array a) (first2 a) (last2 a)) x (last2 a))
  (of_array (to_array a) (first2 a) (last2 a)) x (last2 a))
  (=>
  (= (ind_prop (of_array (to_array a) (first2 a) (last2 a)) x (last2 a)) true)
  (<= (last2 a) (last2 a)))))))))
(check-sat)
(exit)
