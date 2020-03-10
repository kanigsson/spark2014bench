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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

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

(declare-fun user_eq2 (positive positive) Bool)

(declare-const dummy2 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(declare-fun id (Int) Int)

(declare-fun id__function_guard (Int Int) Bool)

;; id__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true)
     (let ((result (id x)))
     (=> (id__function_guard result x) (dynamic_invariant result true false
     true true)))) :pattern ((id x)) )))

;; id__def_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true) (= (id x) x)) :pattern (
  (id x)) )))

(declare-const zero Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun to_rep1 ((x natural)) Int (naturalqtint x))

(declare-fun of_rep1 (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range1 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int natural))))))
(declare-fun slide ((Array Int natural) Int Int) (Array Int natural))

;; slide_eq
  (assert
  (forall ((a (Array Int natural)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int natural)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int natural)) (a__first Int) (a__last Int)
  (b (Array Int natural)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                                                  (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int natural)) (b (Array Int natural)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

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
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int natural))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int natural) (elts a))

(define-fun of_array ((a (Array Int natural)) (f Int)
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

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ((nat_array__ref 0))
(((nat_array__refqtmk (nat_array__content us_t)))))
(define-fun nat_array__ref_nat_array__content__projection ((a nat_array__ref)) us_t 
  (nat_array__content a))

(declare-datatypes ((small_nat_array__ref 0))
(((small_nat_array__refqtmk (small_nat_array__content us_t)))))
(define-fun small_nat_array__ref_small_nat_array__content__projection ((a small_nat_array__ref)) us_t 
  (small_nat_array__content a))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__subtype_check__r__d integer)))))
(define-fun us_split_discrs_rec__subtype_check__r__d__projection ((a us_split_discrs)) integer 
  (rec__subtype_check__r__d a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__subtype_check__r__f integer)))))
(define-fun us_split_fields_rec__subtype_check__r__f__projection ((a us_split_fields)) integer 
  (rec__subtype_check__r__f a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq2 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__subtype_check__r__d (us_split_discrs1 a))) 
                        (to_rep
                        (rec__subtype_check__r__d (us_split_discrs1 b))))
                        (= (to_rep
                           (rec__subtype_check__r__f (us_split_fields1 a))) 
                        (to_rep
                        (rec__subtype_check__r__f (us_split_fields1 b)))))
                   true false))

(define-fun in_range3 ((rec__subtype_check__r__d1 Int)
  (a us_split_discrs)) Bool (= rec__subtype_check__r__d1 (to_rep
                                                         (rec__subtype_check__r__d
                                                         a))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const subtype_check__r__d__first__bit Int)

(declare-const subtype_check__r__d__last__bit Int)

(declare-const subtype_check__r__d__position Int)

;; subtype_check__r__d__first__bit_axiom
  (assert (<= 0 subtype_check__r__d__first__bit))

;; subtype_check__r__d__last__bit_axiom
  (assert (< subtype_check__r__d__first__bit subtype_check__r__d__last__bit))

;; subtype_check__r__d__position_axiom
  (assert (<= 0 subtype_check__r__d__position))

(declare-const subtype_check__r__f__first__bit Int)

(declare-const subtype_check__r__f__last__bit Int)

(declare-const subtype_check__r__f__position Int)

;; subtype_check__r__f__first__bit_axiom
  (assert (<= 0 subtype_check__r__f__first__bit))

;; subtype_check__r__f__last__bit_axiom
  (assert (< subtype_check__r__f__first__bit subtype_check__r__f__last__bit))

;; subtype_check__r__f__position_axiom
  (assert (<= 0 subtype_check__r__f__position))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((r__ref 0))
(((r__refqtmk (r__content us_rep)))))
(define-fun r__ref_r__content__projection ((a r__ref)) us_rep (r__content a))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(define-fun in_range4 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Bool)

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (rec__subtype_check__nat_array_access__is_null_pointer Bool)(rec__subtype_check__nat_array_access__pointer_address Int)(rec__subtype_check__nat_array_access__pointer_value us_t)))))
(define-fun us_rep_rec__subtype_check__nat_array_access__is_null_pointer__projection ((a us_rep1)) Bool 
  (rec__subtype_check__nat_array_access__is_null_pointer a))

(define-fun us_rep_rec__subtype_check__nat_array_access__pointer_address__projection ((a us_rep1)) Int 
  (rec__subtype_check__nat_array_access__pointer_address a))

(define-fun us_rep_rec__subtype_check__nat_array_access__pointer_value__projection ((a us_rep1)) us_t 
  (rec__subtype_check__nat_array_access__pointer_value a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep1)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep1 
  (us_rep__content a))

(define-fun bool_eq3 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (rec__subtype_check__nat_array_access__is_null_pointer
                            a) (rec__subtype_check__nat_array_access__is_null_pointer
                               b))
                         (=>
                         (not
                         (= (rec__subtype_check__nat_array_access__is_null_pointer
                            a) true))
                         (and
                         (= (rec__subtype_check__nat_array_access__pointer_address
                            a) (rec__subtype_check__nat_array_access__pointer_address
                               b))
                         (= (rec__subtype_check__nat_array_access__pointer_value
                            a) (rec__subtype_check__nat_array_access__pointer_value
                               b)))))
                    true false))

(define-fun rec__subtype_check__nat_array_access__pointer_value__pred ((a us_rep1)) Bool 
  (not (= (rec__subtype_check__nat_array_access__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep1)

;; __null_pointer__def_axiom
  (assert
  (= (rec__subtype_check__nat_array_access__is_null_pointer us_null_pointer) true))

(declare-const dummy5 us_rep1)

(declare-datatypes ((nat_array_access__ref 0))
(((nat_array_access__refqtmk (nat_array_access__content us_rep1)))))
(define-fun nat_array_access__ref_nat_array_access__content__projection ((a nat_array_access__ref)) us_rep1 
  (nat_array_access__content a))

(define-fun dynamic_invariant1 ((temp___expr_189 us_rep1)
  (temp___is_init_185 Bool) (temp___skip_constant_186 Bool)
  (temp___do_toplevel_187 Bool)
  (temp___do_typ_inv_188 Bool)) Bool (=>
                                     (not
                                     (= (rec__subtype_check__nat_array_access__is_null_pointer
                                        temp___expr_189) true))
                                     (dynamic_property 1 2147483647
                                     (first1
                                     (rec__subtype_check__nat_array_access__pointer_value
                                     temp___expr_189))
                                     (last1
                                     (rec__subtype_check__nat_array_access__pointer_value
                                     temp___expr_189)))))

(define-fun default_initial_assumption ((temp___expr_191 us_rep1)
  (temp___skip_top_level_192 Bool)) Bool (= (rec__subtype_check__nat_array_access__is_null_pointer
                                            temp___expr_191) true))

(declare-datatypes ((us_rep2 0))
(((us_repqtmk2
  (rec__subtype_check__small_nat_array_access__is_null_pointer Bool)(rec__subtype_check__small_nat_array_access__pointer_address Int)(rec__subtype_check__small_nat_array_access__pointer_value us_t)))))
(define-fun us_rep_rec__subtype_check__small_nat_array_access__is_null_pointer__projection ((a us_rep2)) Bool 
  (rec__subtype_check__small_nat_array_access__is_null_pointer a))

(define-fun us_rep_rec__subtype_check__small_nat_array_access__pointer_address__projection ((a us_rep2)) Int 
  (rec__subtype_check__small_nat_array_access__pointer_address a))

(define-fun us_rep_rec__subtype_check__small_nat_array_access__pointer_value__projection ((a us_rep2)) us_t 
  (rec__subtype_check__small_nat_array_access__pointer_value a))

(declare-datatypes ((us_rep__ref1 0))
(((us_rep__refqtmk1 (us_rep__content1 us_rep2)))))
(define-fun us_rep__ref___rep__content__2__projection ((a us_rep__ref1)) us_rep2 
  (us_rep__content1 a))

(define-fun bool_eq4 ((a us_rep2)
  (b us_rep2)) Bool (ite (and
                         (= (rec__subtype_check__small_nat_array_access__is_null_pointer
                            a) (rec__subtype_check__small_nat_array_access__is_null_pointer
                               b))
                         (=>
                         (not
                         (= (rec__subtype_check__small_nat_array_access__is_null_pointer
                            a) true))
                         (and
                         (= (rec__subtype_check__small_nat_array_access__pointer_address
                            a) (rec__subtype_check__small_nat_array_access__pointer_address
                               b))
                         (= (rec__subtype_check__small_nat_array_access__pointer_value
                            a) (rec__subtype_check__small_nat_array_access__pointer_value
                               b)))))
                    true false))

(define-fun rec__subtype_check__small_nat_array_access__pointer_value__pred ((a us_rep2)) Bool 
  (not
  (= (rec__subtype_check__small_nat_array_access__is_null_pointer a) true)))

(declare-const us_null_pointer1 us_rep2)

;; __null_pointer__def_axiom
  (assert
  (= (rec__subtype_check__small_nat_array_access__is_null_pointer
     us_null_pointer1) true))

(declare-const dummy6 us_rep2)

(declare-datatypes ((small_nat_array_access__ref 0))
(((small_nat_array_access__refqtmk (small_nat_array_access__content us_rep2)))))
(define-fun small_nat_array_access__ref_small_nat_array_access__content__projection ((a small_nat_array_access__ref)) us_rep2 
  (small_nat_array_access__content a))

(define-fun dynamic_invariant2 ((temp___expr_206 us_rep2)
  (temp___is_init_202 Bool) (temp___skip_constant_203 Bool)
  (temp___do_toplevel_204 Bool)
  (temp___do_typ_inv_205 Bool)) Bool (=>
                                     (not
                                     (= (rec__subtype_check__small_nat_array_access__is_null_pointer
                                        temp___expr_206) true))
                                     (and (dynamic_property zero 5
                                     (first1
                                     (rec__subtype_check__small_nat_array_access__pointer_value
                                     temp___expr_206))
                                     (last1
                                     (rec__subtype_check__small_nat_array_access__pointer_value
                                     temp___expr_206)))
                                     (and
                                     (= (first1
                                        (rec__subtype_check__small_nat_array_access__pointer_value
                                        temp___expr_206)) zero)
                                     (= (last1
                                        (rec__subtype_check__small_nat_array_access__pointer_value
                                        temp___expr_206)) 5)))))

(define-fun default_initial_assumption1 ((temp___expr_208 us_rep2)
  (temp___skip_top_level_209 Bool)) Bool (= (rec__subtype_check__small_nat_array_access__is_null_pointer
                                            temp___expr_208) true))

(declare-sort tsmall_nat_array_2P1 0)

(declare-fun tsmall_nat_array_2P1qtint (tsmall_nat_array_2P1) Int)

;; tsmall_nat_array_2P1'axiom
  (assert
  (forall ((i tsmall_nat_array_2P1))
  (and (<= 6 (tsmall_nat_array_2P1qtint i))
  (<= (tsmall_nat_array_2P1qtint i) 10))))

(define-fun in_range5 ((x Int)) Bool (and (<= 6 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq5 (tsmall_nat_array_2P1 tsmall_nat_array_2P1) Bool)

(declare-const dummy7 tsmall_nat_array_2P1)

(declare-datatypes ((tsmall_nat_array_2P1__ref 0))
(((tsmall_nat_array_2P1__refqtmk
  (tsmall_nat_array_2P1__content tsmall_nat_array_2P1)))))
(define-fun tsmall_nat_array_2P1__ref_tsmall_nat_array_2P1__content__projection ((a tsmall_nat_array_2P1__ref)) tsmall_nat_array_2P1 
  (tsmall_nat_array_2P1__content a))

(define-fun default_initial_assumption2 ((temp___expr_216 (Array Int natural))
  (temp___skip_top_level_217 Bool)) Bool (forall ((temp___218 Int))
                                         (=>
                                         (and (<= 6 temp___218)
                                         (<= temp___218 10))
                                         (= (to_rep1
                                            (select temp___expr_216 temp___218)) 1))))

(declare-datatypes ((us_rep3 0))
(((us_repqtmk3
  (rec__subtype_check__r_access__is_null_pointer Bool)(rec__subtype_check__r_access__pointer_address Int)(rec__subtype_check__r_access__pointer_value us_rep)))))
(define-fun us_rep_rec__subtype_check__r_access__is_null_pointer__projection ((a us_rep3)) Bool 
  (rec__subtype_check__r_access__is_null_pointer a))

(define-fun us_rep_rec__subtype_check__r_access__pointer_address__projection ((a us_rep3)) Int 
  (rec__subtype_check__r_access__pointer_address a))

(define-fun us_rep_rec__subtype_check__r_access__pointer_value__projection ((a us_rep3)) us_rep 
  (rec__subtype_check__r_access__pointer_value a))

(declare-datatypes ((us_rep__ref2 0))
(((us_rep__refqtmk2 (us_rep__content2 us_rep3)))))
(define-fun us_rep__ref___rep__content__3__projection ((a us_rep__ref2)) us_rep3 
  (us_rep__content2 a))

(define-fun bool_eq5 ((a us_rep3)
  (b us_rep3)) Bool (ite (and
                         (= (rec__subtype_check__r_access__is_null_pointer a) 
                         (rec__subtype_check__r_access__is_null_pointer b))
                         (=>
                         (not
                         (= (rec__subtype_check__r_access__is_null_pointer a) true))
                         (and
                         (= (rec__subtype_check__r_access__pointer_address a) 
                         (rec__subtype_check__r_access__pointer_address b))
                         (= (rec__subtype_check__r_access__pointer_value a) 
                         (rec__subtype_check__r_access__pointer_value b)))))
                    true false))

(define-fun rec__subtype_check__r_access__pointer_value__pred ((a us_rep3)) Bool 
  (not (= (rec__subtype_check__r_access__is_null_pointer a) true)))

(declare-const us_null_pointer2 us_rep3)

;; __null_pointer__def_axiom
  (assert
  (= (rec__subtype_check__r_access__is_null_pointer us_null_pointer2) true))

(declare-const dummy8 us_rep3)

(declare-datatypes ((r_access__ref 0))
(((r_access__refqtmk (r_access__content us_rep3)))))
(define-fun r_access__ref_r_access__content__projection ((a r_access__ref)) us_rep3 
  (r_access__content a))

(define-fun default_initial_assumption3 ((temp___expr_230 us_rep3)
  (temp___skip_top_level_231 Bool)) Bool (= (rec__subtype_check__r_access__is_null_pointer
                                            temp___expr_230) true))

(declare-sort tS10bP1 0)

(declare-fun tS10bP1qtint (tS10bP1) Int)

;; tS10bP1'axiom
  (assert
  (forall ((i tS10bP1))
  (and (<= 1 (tS10bP1qtint i)) (<= (tS10bP1qtint i) 5))))

(define-fun in_range6 ((x Int)) Bool (and (<= 1 x) (<= x 5)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq6 (tS10bP1 tS10bP1) Bool)

(declare-const dummy9 tS10bP1)

(declare-datatypes ((tS10bP1__ref 0))
(((tS10bP1__refqtmk (tS10bP1__content tS10bP1)))))
(define-fun tS10bP1__ref_tS10bP1__content__projection ((a tS10bP1__ref)) tS10bP1 
  (tS10bP1__content a))

(define-fun default_initial_assumption4 ((temp___expr_265 (Array Int natural))
  (temp___skip_top_level_266 Bool)) Bool (forall ((temp___267 Int))
                                         (=>
                                         (and (<= 1 temp___267)
                                         (<= temp___267 5))
                                         (= (to_rep1
                                            (select temp___expr_265 temp___267)) 1))))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const subtype_check__r__d__first__bit1 Int)

(declare-const subtype_check__r__d__last__bit1 Int)

(declare-const subtype_check__r__d__position1 Int)

;; subtype_check__r__d__first__bit_axiom
  (assert (<= 0 subtype_check__r__d__first__bit1))

;; subtype_check__r__d__last__bit_axiom
  (assert
  (< subtype_check__r__d__first__bit1 subtype_check__r__d__last__bit1))

;; subtype_check__r__d__position_axiom
  (assert (<= 0 subtype_check__r__d__position1))

(declare-const subtype_check__r__f__first__bit1 Int)

(declare-const subtype_check__r__f__last__bit1 Int)

(declare-const subtype_check__r__f__position1 Int)

;; subtype_check__r__f__first__bit_axiom
  (assert (<= 0 subtype_check__r__f__first__bit1))

;; subtype_check__r__f__last__bit_axiom
  (assert
  (< subtype_check__r__f__first__bit1 subtype_check__r__f__last__bit1))

;; subtype_check__r__f__position_axiom
  (assert (<= 0 subtype_check__r__f__position1))

(declare-fun user_eq7 (us_rep us_rep) Bool)

(declare-const dummy10 us_rep)

(declare-datatypes ((s12b__ref 0))
(((s12b__refqtmk (s12b__content us_rep)))))
(define-fun s12b__ref_s12b__content__projection ((a s12b__ref)) us_rep 
  (s12b__content a))

(define-fun dynamic_invariant3 ((temp___expr_272 us_rep)
  (temp___is_init_268 Bool) (temp___skip_constant_269 Bool)
  (temp___do_toplevel_270 Bool)
  (temp___do_typ_inv_271 Bool)) Bool (=>
                                     (not (= temp___skip_constant_269 true))
                                     (in_range3 10
                                     (us_split_discrs1 temp___expr_272))))

(define-fun default_initial_assumption5 ((temp___expr_274 us_rep)
  (temp___skip_top_level_275 Bool)) Bool (and
                                         (= (to_rep
                                            (rec__subtype_check__r__d
                                            (us_split_discrs1
                                            temp___expr_274))) 10)
                                         (= (to_rep
                                            (rec__subtype_check__r__f
                                            (us_split_fields1
                                            temp___expr_274))) 1)))

(define-fun dynamic_invariant4 ((temp___expr_197 us_t)
  (temp___is_init_193 Bool) (temp___skip_constant_194 Bool)
  (temp___do_toplevel_195 Bool)
  (temp___do_typ_inv_196 Bool)) Bool (=>
                                     (not (= temp___skip_constant_194 true))
                                     (and (dynamic_property zero 5
                                     (first1 temp___expr_197)
                                     (last1 temp___expr_197))
                                     (and (= (first1 temp___expr_197) 
                                     zero) (= (last1 temp___expr_197) 5)))))

(define-fun default_initial_assumption6 ((temp___expr_199 us_t)
  (temp___skip_top_level_200 Bool)) Bool (and
                                         (and
                                         (= (first1 temp___expr_199) 
                                         zero) (= (last1 temp___expr_199) 5))
                                         (forall ((temp___201 Int))
                                         (=>
                                         (and
                                         (<= (first1 temp___expr_199) temp___201)
                                         (<= temp___201 (last1
                                                        temp___expr_199)))
                                         (= (to_rep1
                                            (select (to_array
                                                    temp___expr_199) temp___201)) 1)))))

(define-fun dynamic_invariant5 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(define-fun dynamic_invariant6 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

(define-fun dynamic_invariant7 ((temp___expr_183 us_t)
  (temp___is_init_179 Bool) (temp___skip_constant_180 Bool)
  (temp___do_toplevel_181 Bool)
  (temp___do_typ_inv_182 Bool)) Bool (=>
                                     (not (= temp___skip_constant_180 true))
                                     (dynamic_property 1 2147483647
                                     (first1 temp___expr_183)
                                     (last1 temp___expr_183))))

;; zero__def_axiom
  (assert (and (id__function_guard (id 1) 1) (= zero (id 1))))

(assert
;; defqtvc
 ;; File "subtype_check.adb", line 1, characters 0-0
  (not
  (let ((subtype_check__zero__assume (id 1)))
  (=>
  (and (id__function_guard subtype_check__zero__assume 1)
  (and (dynamic_invariant subtype_check__zero__assume true false true true)
  (= subtype_check__zero__assume 1)))
  (=> (= subtype_check__zero__assume zero)
  (=> (dynamic_invariant zero true false true true)
  (forall ((us_next_pointer_address Int))
  (forall ((temp___alloc_280 us_rep1))
  (=>
  (and
  (not
  (= (rec__subtype_check__nat_array_access__is_null_pointer temp___alloc_280) true))
  (= (rec__subtype_check__nat_array_access__pointer_address temp___alloc_280) us_next_pointer_address))
  (forall ((usf us_t))
  (=>
  (and (default_initial_assumption6 usf false) (dynamic_invariant4 usf true
  false true true))
  (=>
  (= (rec__subtype_check__nat_array_access__pointer_value temp___alloc_280) 
  (of_array (to_array usf) (first1 usf) (last1 usf)))
  (forall ((x__pointer_value us_t))
  (=>
  (= x__pointer_value (rec__subtype_check__nat_array_access__pointer_value
                      temp___alloc_280))
  (forall ((x__pointer_address Int))
  (=>
  (= x__pointer_address (rec__subtype_check__nat_array_access__pointer_address
                        temp___alloc_280))
  (forall ((x__is_null_pointer Bool))
  (=>
  (= x__is_null_pointer (rec__subtype_check__nat_array_access__is_null_pointer
                        temp___alloc_280))
  (=> (dynamic_invariant1
  (us_repqtmk1 x__is_null_pointer x__pointer_address x__pointer_value) true
  false true true)
  (forall ((us_next_pointer_address1 Int))
  (forall ((temp___alloc_283 us_rep1))
  (=>
  (and
  (not
  (= (rec__subtype_check__nat_array_access__is_null_pointer temp___alloc_283) true))
  (= (rec__subtype_check__nat_array_access__pointer_address temp___alloc_283) us_next_pointer_address1))
  (forall ((usf1 (Array Int natural)))
  (=> (default_initial_assumption4 usf1 false)
  (=>
  (= (rec__subtype_check__nat_array_access__pointer_value temp___alloc_283) 
  (of_array usf1 1 5))
  (forall ((x2__pointer_value us_t))
  (=>
  (= x2__pointer_value (rec__subtype_check__nat_array_access__pointer_value
                       temp___alloc_283))
  (forall ((x2__pointer_address Int))
  (=>
  (= x2__pointer_address (rec__subtype_check__nat_array_access__pointer_address
                         temp___alloc_283))
  (forall ((x2__is_null_pointer Bool))
  (=>
  (= x2__is_null_pointer (rec__subtype_check__nat_array_access__is_null_pointer
                         temp___alloc_283))
  (=> (dynamic_invariant1
  (us_repqtmk1 x2__is_null_pointer x2__pointer_address x2__pointer_value)
  true false true true)
  (=> (in_range 10)
  (=>
  (exists ((usf2 us_rep))
  (= 10 (to_rep (rec__subtype_check__r__d (us_split_discrs1 usf2)))))
  (forall ((us_next_pointer_address2 Int))
  (forall ((temp___alloc_286 us_rep3))
  (=>
  (and
  (not
  (= (rec__subtype_check__r_access__is_null_pointer temp___alloc_286) true))
  (= (rec__subtype_check__r_access__pointer_address temp___alloc_286) us_next_pointer_address2))
  (forall ((usf2 us_rep))
  (=>
  (and (default_initial_assumption5 usf2 false) (dynamic_invariant3 usf2 true
  false true true))
  (=> (= (rec__subtype_check__r_access__pointer_value temp___alloc_286) usf2)
  (forall ((y__pointer_value us_rep))
  (=>
  (= y__pointer_value (rec__subtype_check__r_access__pointer_value
                      temp___alloc_286))
  (forall ((y__pointer_address Int))
  (=>
  (= y__pointer_address (rec__subtype_check__r_access__pointer_address
                        temp___alloc_286))
  (forall ((y__is_null_pointer Bool))
  (=>
  (= y__is_null_pointer (rec__subtype_check__r_access__is_null_pointer
                        temp___alloc_286))
  (forall ((us_next_pointer_address3 Int))
  (forall ((temp___alloc_290 us_rep2))
  (=>
  (and
  (not
  (= (rec__subtype_check__small_nat_array_access__is_null_pointer
     temp___alloc_290) true))
  (= (rec__subtype_check__small_nat_array_access__pointer_address
     temp___alloc_290) us_next_pointer_address3))
  (forall ((usf3 (Array Int natural)))
  (=> (default_initial_assumption2 usf3 false)
  (=> (ite (<= 6 10) (and (<= zero 5) (= (- 10 6) (- 5 zero))) (< 5 zero))
  (=>
  (= (rec__subtype_check__small_nat_array_access__pointer_value
     temp___alloc_290) (of_array (slide usf3 6 zero) zero 5))
  (forall ((z__pointer_value us_t))
  (=>
  (= z__pointer_value (rec__subtype_check__small_nat_array_access__pointer_value
                      temp___alloc_290))
  (forall ((z__pointer_address Int))
  (=>
  (= z__pointer_address (rec__subtype_check__small_nat_array_access__pointer_address
                        temp___alloc_290))
  (forall ((z__is_null_pointer Bool))
  (=>
  (= z__is_null_pointer (rec__subtype_check__small_nat_array_access__is_null_pointer
                        temp___alloc_290))
  (=> (dynamic_invariant2
  (us_repqtmk2 z__is_null_pointer z__pointer_address z__pointer_value) true
  false true true)
  (=> (= (first1 x__pointer_value) 1)
  (rec__subtype_check__nat_array_access__pointer_value__pred
  (us_repqtmk1 x2__is_null_pointer x2__pointer_address x2__pointer_value)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
