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

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

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
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int integer))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int integer) (elts a))

(define-fun of_array ((a (Array Int integer)) (f Int)
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

(declare-datatypes ((t_arr__ref 0))
(((t_arr__refqtmk (t_arr__content us_t)))))
(define-fun t_arr__ref_t_arr__content__projection ((a t_arr__ref)) us_t 
  (t_arr__content a))

(declare-fun equal_subrange (us_t Int us_t) Bool)

(declare-fun equal_subrange__function_guard (Bool us_t Int us_t) Bool)

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant1 ((temp___expr_163 us_t)
  (temp___is_init_159 Bool) (temp___skip_constant_160 Bool)
  (temp___do_toplevel_161 Bool)
  (temp___do_typ_inv_162 Bool)) Bool (=>
                                     (not (= temp___skip_constant_160 true))
                                     (dynamic_property 1 2147483647
                                     (first1 temp___expr_163)
                                     (last1 temp___expr_163))))

(declare-datatypes ((t12s__ref 0))
(((t12s__refqtmk (t12s__content us_t)))))
(define-fun t12s__ref_t12s__content__projection ((a t12s__ref)) us_t 
  (t12s__content a))

;; equal_subrange__post_axiom
  (assert true)

;; equal_subrange__def_axiom
  (assert
  (forall ((a us_t) (b us_t))
  (forall ((j Int))
  (! (= (= (equal_subrange a j b) true)
     (= (let ((temp___176 (let ((temp___173 (+ (- j 1) (length1 b))))
                          (of_array (to_array a) j temp___173))))
        (bool_eq (to_array temp___176) (first1 temp___176) (last1 temp___176)
        (to_array b) (first1 b) (last1 b))) true)) :pattern ((equal_subrange
                                                             a j b)) ))))

(declare-fun has_sub_range_in_prefix (us_t Int us_t) Bool)

(declare-fun has_sub_range_in_prefix__function_guard (Bool us_t Int
  us_t) Bool)

;; has_sub_range_in_prefix__post_axiom
  (assert true)

;; has_sub_range_in_prefix__def_axiom
  (assert
  (forall ((a us_t) (b us_t))
  (forall ((last2 Int))
  (! (and
     (forall ((a1 us_t) (b1 us_t) (j Int)) (equal_subrange__function_guard
     (equal_subrange a1 j b1) a1 j b1))
     (= (= (has_sub_range_in_prefix a last2 b) true)
     (exists ((j Int))
     (and (and (<= (first1 a) j) (<= j last2))
     (= (equal_subrange a j b) true))))) :pattern ((has_sub_range_in_prefix a
                                                   last2 b)) ))))

(declare-fun has_sub_range (us_t us_t) Bool)

(declare-fun has_sub_range__function_guard (Bool us_t us_t) Bool)

;; has_sub_range__post_axiom
  (assert true)

;; has_sub_range__def_axiom
  (assert
  (forall ((a us_t) (b us_t))
  (! (and
     (forall ((a1 us_t) (b1 us_t)) (has_sub_range_in_prefix__function_guard
     (has_sub_range_in_prefix a1 (- (+ (last1 a1) 1) (length1 b1)) b1) a1
     (- (+ (last1 a1) 1) (length1 b1)) b1))
     (= (= (has_sub_range a b) true)
     (= (has_sub_range_in_prefix a (- (+ (last1 a) 1) (length1 b)) b) true))) :pattern (
  (has_sub_range a b)) )))

(declare-const a us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const b us_t)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__types__option__exists Bool)(rec__types__option__value integer)))))
(define-fun us_split_fields_rec__types__option__exists__projection ((a1 us_split_fields)) Bool 
  (rec__types__option__exists a1))

(define-fun us_split_fields_rec__types__option__value__projection ((a1 us_split_fields)) integer 
  (rec__types__option__value a1))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a1 us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a1))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a1 us_rep)) us_split_fields 
  (us_split_fields1 a1))

(define-fun bool_eq2 ((a1 us_rep)
  (b1 us_rep)) Bool (ite (and
                         (= (ite (rec__types__option__exists
                                 (us_split_fields1 a1)) 1 0) (ite (rec__types__option__exists
                                                                  (us_split_fields1
                                                                  b1)) 1 0))
                         (= (to_rep
                            (rec__types__option__value (us_split_fields1 a1))) 
                         (to_rep
                         (rec__types__option__value (us_split_fields1 b1)))))
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

(declare-const types__option__exists__first__bit Int)

(declare-const types__option__exists__last__bit Int)

(declare-const types__option__exists__position Int)

;; types__option__exists__first__bit_axiom
  (assert (<= 0 types__option__exists__first__bit))

;; types__option__exists__last__bit_axiom
  (assert
  (< types__option__exists__first__bit types__option__exists__last__bit))

;; types__option__exists__position_axiom
  (assert (<= 0 types__option__exists__position))

(declare-const types__option__value__first__bit Int)

(declare-const types__option__value__last__bit Int)

(declare-const types__option__value__position Int)

;; types__option__value__first__bit_axiom
  (assert (<= 0 types__option__value__first__bit))

;; types__option__value__last__bit_axiom
  (assert
  (< types__option__value__first__bit types__option__value__last__bit))

;; types__option__value__position_axiom
  (assert (<= 0 types__option__value__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((option__ref 0))
(((option__refqtmk (option__content us_rep)))))
(define-fun option__ref_option__content__projection ((a1 option__ref)) us_rep 
  (option__content a1))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(define-fun dynamic_property1 ((first_int Int) (last_int Int)
  (x Int)) Bool (and (<= first_int x) (<= x last_int)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq4 (integer integer) Bool)

(declare-const dummy4 integer)

(declare-datatypes ((t4b__ref 0))
(((t4b__refqtmk (t4b__content integer)))))
(define-fun t4b__ref_t4b__content__projection ((a1 t4b__ref)) integer 
  (t4b__content a1))

(define-fun dynamic_invariant2 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 1))

(assert
;; defqtvc
 ;; File "search_ter_p.ads", line 32, characters 0-0
  (not
  (=> (dynamic_invariant1 a true false true true)
  (=> (dynamic_invariant1 b true false true true)
  (=> (< (last1 a) 2147483647)
  (=> (<= (first1 b) (last1 b))
  (=> (has_sub_range__function_guard (has_sub_range a b) a b)
  (forall ((result____split_fields us_split_fields))
  (=>
  (= result____split_fields (us_split_fieldsqtmk (distinct 0 0) rliteral))
  (forall ((o Bool))
  (=>
  (ite (< (length1 a) (length1 b)) (= o true)
  (= o (ite (= (length1 b) 0) true false)))
  (forall ((spark__branch Bool))
  (=> (= spark__branch o)
  (=> (not (= spark__branch true))
  (let ((o1 (length1 b)))
  (=> (in_range1 o1)
  (let ((o2 (+ (last1 a) 1))) (=> (in_range1 o2) (in_range1 (- o2 o1))))))))))))))))))))
(check-sat)
(exit)
