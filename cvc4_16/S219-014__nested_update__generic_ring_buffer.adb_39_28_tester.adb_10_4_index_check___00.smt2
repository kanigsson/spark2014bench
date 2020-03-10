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

(declare-sort small_natural 0)

(declare-fun small_naturalqtint (small_natural) Int)

;; small_natural'axiom
  (assert
  (forall ((i small_natural))
  (and (<= 0 (small_naturalqtint i)) (<= (small_naturalqtint i) 1073741823))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 1073741823)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (small_natural small_natural) Bool)

(declare-const dummy small_natural)

(declare-datatypes ((small_natural__ref 0))
(((small_natural__refqtmk (small_natural__content small_natural)))))
(define-fun small_natural__ref_small_natural__content__projection ((a small_natural__ref)) small_natural 
  (small_natural__content a))

(define-fun to_rep ((x small_natural)) Int (small_naturalqtint x))

(declare-fun of_rep (Int) small_natural)

;; inversion_axiom
  (assert
  (forall ((x small_natural))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x small_natural)) (! (in_range
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort small_positive 0)

(declare-fun small_positiveqtint (small_positive) Int)

;; small_positive'axiom
  (assert
  (forall ((i small_positive))
  (and (<= 1 (small_positiveqtint i))
  (<= (small_positiveqtint i) 1073741823))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 1073741823)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (small_positive small_positive) Bool)

(declare-const dummy1 small_positive)

(declare-datatypes ((small_positive__ref 0))
(((small_positive__refqtmk (small_positive__content small_positive)))))
(define-fun small_positive__ref_small_positive__content__projection ((a small_positive__ref)) small_positive 
  (small_positive__content a))

(define-fun to_rep1 ((x small_positive)) Int (small_positiveqtint x))

(declare-fun of_rep1 (Int) small_positive)

;; inversion_axiom
  (assert
  (forall ((x small_positive))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x small_positive)) (! (in_range1
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (integer integer) Bool)

(declare-const dummy2 integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep2 ((x integer)) Int (integerqtint x))

(declare-fun of_rep2 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range2 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-sort element_type 0)

(declare-fun element_typeqtint (element_type) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type))
  (and (<= (- 2147483648) (element_typeqtint i))
  (<= (element_typeqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (element_type element_type) Bool)

(declare-const dummy3 element_type)

(declare-datatypes ((element_type__ref 0))
(((element_type__refqtmk (element_type__content element_type)))))
(define-fun element_type__ref_element_type__content__projection ((a element_type__ref)) element_type 
  (element_type__content a))

(define-fun to_rep3 ((x element_type)) Int (element_typeqtint x))

(declare-fun of_rep3 (Int) element_type)

;; inversion_axiom
  (assert
  (forall ((x element_type))
  (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; range_axiom
  (assert
  (forall ((x element_type)) (! (in_range3
  (to_rep3 x)) :pattern ((to_rep3 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep3 (of_rep3 x)) x)) :pattern ((to_rep3
                                                              (of_rep3 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int element_type))))))
(declare-fun slide ((Array Int element_type) Int
  Int) (Array Int element_type))

;; slide_eq
  (assert
  (forall ((a (Array Int element_type)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int element_type)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int element_type)) (a__first Int)
  (a__last Int) (b (Array Int element_type)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_156 Int))
                           (=>
                           (and (<= a__first temp___idx_156)
                           (<= temp___idx_156 a__last))
                           (= (to_rep3 (select a temp___idx_156)) (to_rep3
                                                                  (select b (+ (- b__first a__first) temp___idx_156)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int element_type)) (b (Array Int element_type)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_156 Int))
  (=> (and (<= a__first temp___idx_156) (<= temp___idx_156 a__last))
  (= (to_rep3 (select a temp___idx_156)) (to_rep3
                                         (select b (+ (- b__first a__first) temp___idx_156)))))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range2 f)
     (=> (in_range2 l)
     (and (= (to_rep2 (first (mk f l))) f) (= (to_rep2 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range2 low)
                   (and (in_range2 high)
                   (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int element_type))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int element_type) (elts a))

(define-fun of_array ((a (Array Int element_type)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep2 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep2 (last (rt a))))

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
  (y us_t)) Bool (bool_eq (elts x) (to_rep2 (first (rt x)))
                 (to_rep2 (last (rt x))) (elts y) (to_rep2 (first (rt y)))
                 (to_rep2 (last (rt y)))))

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ((element_array_type__ref 0))
(((element_array_type__refqtmk (element_array_type__content us_t)))))
(define-fun element_array_type__ref_element_array_type__content__projection ((a element_array_type__ref)) us_t 
  (element_array_type__content a))

(declare-datatypes ((t4b__ref 0))
(((t4b__refqtmk (t4b__content us_t)))))
(define-fun t4b__ref_t4b__content__projection ((a t4b__ref)) us_t (t4b__content
                                                                  a))

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk
  (rec__tester__ring_buffer__ring_buffer_type__max_size small_positive)))))
(define-fun us_split_discrs_rec__tester__ring_buffer__ring_buffer_type__max_size__projection ((a us_split_discrs)) small_positive 
  (rec__tester__ring_buffer__ring_buffer_type__max_size a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__tester__ring_buffer__ring_buffer_type__count small_natural)(rec__tester__ring_buffer__ring_buffer_type__head small_positive)(rec__tester__ring_buffer__ring_buffer_type__tail small_positive)(rec__tester__ring_buffer__ring_buffer_type__items us_t)))))
(define-fun us_split_fields_rec__tester__ring_buffer__ring_buffer_type__count__projection ((a us_split_fields)) small_natural 
  (rec__tester__ring_buffer__ring_buffer_type__count a))

(define-fun us_split_fields_rec__tester__ring_buffer__ring_buffer_type__head__projection ((a us_split_fields)) small_positive 
  (rec__tester__ring_buffer__ring_buffer_type__head a))

(define-fun us_split_fields_rec__tester__ring_buffer__ring_buffer_type__tail__projection ((a us_split_fields)) small_positive 
  (rec__tester__ring_buffer__ring_buffer_type__tail a))

(define-fun us_split_fields_rec__tester__ring_buffer__ring_buffer_type__items__projection ((a us_split_fields)) us_t 
  (rec__tester__ring_buffer__ring_buffer_type__items a))

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
                        (= (to_rep1
                           (rec__tester__ring_buffer__ring_buffer_type__max_size
                           (us_split_discrs1 a))) (to_rep1
                                                  (rec__tester__ring_buffer__ring_buffer_type__max_size
                                                  (us_split_discrs1 b))))
                        (and
                        (and
                        (= (to_rep
                           (rec__tester__ring_buffer__ring_buffer_type__count
                           (us_split_fields1 a))) (to_rep
                                                  (rec__tester__ring_buffer__ring_buffer_type__count
                                                  (us_split_fields1 b))))
                        (= (to_rep1
                           (rec__tester__ring_buffer__ring_buffer_type__head
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__tester__ring_buffer__ring_buffer_type__head
                                                  (us_split_fields1 b)))))
                        (and
                        (= (to_rep1
                           (rec__tester__ring_buffer__ring_buffer_type__tail
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__tester__ring_buffer__ring_buffer_type__tail
                                                  (us_split_fields1 b))))
                        (= (bool_eq1
                           (rec__tester__ring_buffer__ring_buffer_type__items
                           (us_split_fields1 a))
                           (rec__tester__ring_buffer__ring_buffer_type__items
                           (us_split_fields1 b))) true))))
                   true false))

(define-fun in_range4 ((rec__tester__ring_buffer__ring_buffer_type__max_size1 Int)
  (a us_split_discrs)) Bool (= rec__tester__ring_buffer__ring_buffer_type__max_size1 
  (to_rep1 (rec__tester__ring_buffer__ring_buffer_type__max_size a))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const tester__ring_buffer__ring_buffer_type__max_size__first__bit Int)

(declare-const tester__ring_buffer__ring_buffer_type__max_size__last__bit Int)

(declare-const tester__ring_buffer__ring_buffer_type__max_size__position Int)

;; tester__ring_buffer__ring_buffer_type__max_size__first__bit_axiom
  (assert (<= 0 tester__ring_buffer__ring_buffer_type__max_size__first__bit))

;; tester__ring_buffer__ring_buffer_type__max_size__last__bit_axiom
  (assert
  (< tester__ring_buffer__ring_buffer_type__max_size__first__bit tester__ring_buffer__ring_buffer_type__max_size__last__bit))

;; tester__ring_buffer__ring_buffer_type__max_size__position_axiom
  (assert (<= 0 tester__ring_buffer__ring_buffer_type__max_size__position))

(declare-const tester__ring_buffer__ring_buffer_type__count__first__bit Int)

(declare-const tester__ring_buffer__ring_buffer_type__count__last__bit Int)

(declare-const tester__ring_buffer__ring_buffer_type__count__position Int)

;; tester__ring_buffer__ring_buffer_type__count__first__bit_axiom
  (assert (<= 0 tester__ring_buffer__ring_buffer_type__count__first__bit))

;; tester__ring_buffer__ring_buffer_type__count__last__bit_axiom
  (assert
  (< tester__ring_buffer__ring_buffer_type__count__first__bit tester__ring_buffer__ring_buffer_type__count__last__bit))

;; tester__ring_buffer__ring_buffer_type__count__position_axiom
  (assert (<= 0 tester__ring_buffer__ring_buffer_type__count__position))

(declare-const tester__ring_buffer__ring_buffer_type__head__first__bit Int)

(declare-const tester__ring_buffer__ring_buffer_type__head__last__bit Int)

(declare-const tester__ring_buffer__ring_buffer_type__head__position Int)

;; tester__ring_buffer__ring_buffer_type__head__first__bit_axiom
  (assert (<= 0 tester__ring_buffer__ring_buffer_type__head__first__bit))

;; tester__ring_buffer__ring_buffer_type__head__last__bit_axiom
  (assert
  (< tester__ring_buffer__ring_buffer_type__head__first__bit tester__ring_buffer__ring_buffer_type__head__last__bit))

;; tester__ring_buffer__ring_buffer_type__head__position_axiom
  (assert (<= 0 tester__ring_buffer__ring_buffer_type__head__position))

(declare-const tester__ring_buffer__ring_buffer_type__tail__first__bit Int)

(declare-const tester__ring_buffer__ring_buffer_type__tail__last__bit Int)

(declare-const tester__ring_buffer__ring_buffer_type__tail__position Int)

;; tester__ring_buffer__ring_buffer_type__tail__first__bit_axiom
  (assert (<= 0 tester__ring_buffer__ring_buffer_type__tail__first__bit))

;; tester__ring_buffer__ring_buffer_type__tail__last__bit_axiom
  (assert
  (< tester__ring_buffer__ring_buffer_type__tail__first__bit tester__ring_buffer__ring_buffer_type__tail__last__bit))

;; tester__ring_buffer__ring_buffer_type__tail__position_axiom
  (assert (<= 0 tester__ring_buffer__ring_buffer_type__tail__position))

(declare-const tester__ring_buffer__ring_buffer_type__items__first__bit Int)

(declare-const tester__ring_buffer__ring_buffer_type__items__last__bit Int)

(declare-const tester__ring_buffer__ring_buffer_type__items__position Int)

;; tester__ring_buffer__ring_buffer_type__items__first__bit_axiom
  (assert (<= 0 tester__ring_buffer__ring_buffer_type__items__first__bit))

;; tester__ring_buffer__ring_buffer_type__items__last__bit_axiom
  (assert
  (< tester__ring_buffer__ring_buffer_type__items__first__bit tester__ring_buffer__ring_buffer_type__items__last__bit))

;; tester__ring_buffer__ring_buffer_type__items__position_axiom
  (assert (<= 0 tester__ring_buffer__ring_buffer_type__items__position))

(declare-fun user_eq5 (us_rep us_rep) Bool)

(declare-const dummy5 us_rep)

(declare-datatypes ((ring_buffer_type__ref 0))
(((ring_buffer_type__refqtmk (ring_buffer_type__content us_rep)))))
(define-fun ring_buffer_type__ref_ring_buffer_type__content__projection ((a ring_buffer_type__ref)) us_rep 
  (ring_buffer_type__content a))

(declare-fun empty (us_rep) Bool)

(declare-fun empty__function_guard (Bool us_rep) Bool)

(declare-fun size (us_rep) Int)

(declare-fun size__function_guard (Int us_rep) Bool)

(define-fun dynamic_invariant ((temp___expr_224 us_rep)
  (temp___is_init_220 Bool) (temp___skip_constant_221 Bool)
  (temp___do_toplevel_222 Bool)
  (temp___do_typ_inv_223 Bool)) Bool (and
                                     (=> (= temp___do_toplevel_222 true)
                                     (and
                                     (and
                                     (and
                                     (and
                                     (<= (to_rep1
                                         (rec__tester__ring_buffer__ring_buffer_type__max_size
                                         (us_split_discrs1 temp___expr_224))) 1073741823)
                                     (<= (to_rep
                                         (rec__tester__ring_buffer__ring_buffer_type__count
                                         (us_split_fields1 temp___expr_224))) 
                                     (to_rep1
                                     (rec__tester__ring_buffer__ring_buffer_type__max_size
                                     (us_split_discrs1 temp___expr_224)))))
                                     (<= (to_rep1
                                         (rec__tester__ring_buffer__ring_buffer_type__head
                                         (us_split_fields1 temp___expr_224))) 
                                     (to_rep1
                                     (rec__tester__ring_buffer__ring_buffer_type__max_size
                                     (us_split_discrs1 temp___expr_224)))))
                                     (<= (to_rep1
                                         (rec__tester__ring_buffer__ring_buffer_type__tail
                                         (us_split_fields1 temp___expr_224))) 
                                     (to_rep1
                                     (rec__tester__ring_buffer__ring_buffer_type__max_size
                                     (us_split_discrs1 temp___expr_224)))))
                                     (or
                                     (or
                                     (and
                                     (and
                                     (= (to_rep
                                        (rec__tester__ring_buffer__ring_buffer_type__count
                                        (us_split_fields1 temp___expr_224))) 0)
                                     (= (to_rep1
                                        (rec__tester__ring_buffer__ring_buffer_type__tail
                                        (us_split_fields1 temp___expr_224))) 
                                     (to_rep1
                                     (rec__tester__ring_buffer__ring_buffer_type__max_size
                                     (us_split_discrs1 temp___expr_224)))))
                                     (= (to_rep1
                                        (rec__tester__ring_buffer__ring_buffer_type__head
                                        (us_split_fields1 temp___expr_224))) 1))
                                     (= (to_rep
                                        (rec__tester__ring_buffer__ring_buffer_type__count
                                        (us_split_fields1 temp___expr_224))) (+ (- (+ 
                                     (to_rep1
                                     (rec__tester__ring_buffer__ring_buffer_type__max_size
                                     (us_split_discrs1 temp___expr_224))) 
                                     (to_rep1
                                     (rec__tester__ring_buffer__ring_buffer_type__tail
                                     (us_split_fields1 temp___expr_224)))) 
                                     (to_rep1
                                     (rec__tester__ring_buffer__ring_buffer_type__head
                                     (us_split_fields1 temp___expr_224)))) 1)))
                                     (= (to_rep
                                        (rec__tester__ring_buffer__ring_buffer_type__count
                                        (us_split_fields1 temp___expr_224))) (+ (- 
                                     (to_rep1
                                     (rec__tester__ring_buffer__ring_buffer_type__tail
                                     (us_split_fields1 temp___expr_224))) 
                                     (to_rep1
                                     (rec__tester__ring_buffer__ring_buffer_type__head
                                     (us_split_fields1 temp___expr_224)))) 1)))))
                                     (let ((temp___226 (rec__tester__ring_buffer__ring_buffer_type__max_size
                                                       (us_split_discrs1
                                                       temp___expr_224))))
                                     (and (dynamic_property 1
                                     (to_rep1 temp___226)
                                     (first1
                                     (rec__tester__ring_buffer__ring_buffer_type__items
                                     (us_split_fields1 temp___expr_224)))
                                     (last1
                                     (rec__tester__ring_buffer__ring_buffer_type__items
                                     (us_split_fields1 temp___expr_224))))
                                     (and
                                     (= (first1
                                        (rec__tester__ring_buffer__ring_buffer_type__items
                                        (us_split_fields1 temp___expr_224))) 1)
                                     (= (last1
                                        (rec__tester__ring_buffer__ring_buffer_type__items
                                        (us_split_fields1 temp___expr_224))) 
                                     (to_rep1 temp___226)))))))

(define-fun dynamic_predicate ((temp___228 us_rep)) Bool (and
                                                         (and
                                                         (and
                                                         (and
                                                         (<= (to_rep1
                                                             (rec__tester__ring_buffer__ring_buffer_type__max_size
                                                             (us_split_discrs1
                                                             temp___228))) 1073741823)
                                                         (<= (to_rep
                                                             (rec__tester__ring_buffer__ring_buffer_type__count
                                                             (us_split_fields1
                                                             temp___228))) 
                                                         (to_rep1
                                                         (rec__tester__ring_buffer__ring_buffer_type__max_size
                                                         (us_split_discrs1
                                                         temp___228)))))
                                                         (<= (to_rep1
                                                             (rec__tester__ring_buffer__ring_buffer_type__head
                                                             (us_split_fields1
                                                             temp___228))) 
                                                         (to_rep1
                                                         (rec__tester__ring_buffer__ring_buffer_type__max_size
                                                         (us_split_discrs1
                                                         temp___228)))))
                                                         (<= (to_rep1
                                                             (rec__tester__ring_buffer__ring_buffer_type__tail
                                                             (us_split_fields1
                                                             temp___228))) 
                                                         (to_rep1
                                                         (rec__tester__ring_buffer__ring_buffer_type__max_size
                                                         (us_split_discrs1
                                                         temp___228)))))
                                                         (or
                                                         (or
                                                         (and
                                                         (and
                                                         (= (to_rep
                                                            (rec__tester__ring_buffer__ring_buffer_type__count
                                                            (us_split_fields1
                                                            temp___228))) 0)
                                                         (= (to_rep1
                                                            (rec__tester__ring_buffer__ring_buffer_type__tail
                                                            (us_split_fields1
                                                            temp___228))) 
                                                         (to_rep1
                                                         (rec__tester__ring_buffer__ring_buffer_type__max_size
                                                         (us_split_discrs1
                                                         temp___228)))))
                                                         (= (to_rep1
                                                            (rec__tester__ring_buffer__ring_buffer_type__head
                                                            (us_split_fields1
                                                            temp___228))) 1))
                                                         (= (to_rep
                                                            (rec__tester__ring_buffer__ring_buffer_type__count
                                                            (us_split_fields1
                                                            temp___228))) (+ (- (+ 
                                                         (to_rep1
                                                         (rec__tester__ring_buffer__ring_buffer_type__max_size
                                                         (us_split_discrs1
                                                         temp___228))) 
                                                         (to_rep1
                                                         (rec__tester__ring_buffer__ring_buffer_type__tail
                                                         (us_split_fields1
                                                         temp___228)))) 
                                                         (to_rep1
                                                         (rec__tester__ring_buffer__ring_buffer_type__head
                                                         (us_split_fields1
                                                         temp___228)))) 1)))
                                                         (= (to_rep
                                                            (rec__tester__ring_buffer__ring_buffer_type__count
                                                            (us_split_fields1
                                                            temp___228))) (+ (- 
                                                         (to_rep1
                                                         (rec__tester__ring_buffer__ring_buffer_type__tail
                                                         (us_split_fields1
                                                         temp___228))) 
                                                         (to_rep1
                                                         (rec__tester__ring_buffer__ring_buffer_type__head
                                                         (us_split_fields1
                                                         temp___228)))) 1)))))

;; empty__post_axiom
  (assert true)

;; empty__def_axiom
  (assert
  (forall ((buffer us_rep))
  (! (and
     (forall ((buffer1 us_rep)) (size__function_guard (size buffer1)
     buffer1)) (= (= (empty buffer) true) (= (size buffer) 0))) :pattern (
  (empty buffer)) )))

(declare-const buffer us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const i12b us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq6 (natural natural) Bool)

(declare-const dummy6 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range5
                                    temp___expr_39)))

(define-fun dynamic_invariant2 ((temp___expr_204 Int)
  (temp___is_init_200 Bool) (temp___skip_constant_201 Bool)
  (temp___do_toplevel_202 Bool)
  (temp___do_typ_inv_203 Bool)) Bool (=>
                                     (or (= temp___is_init_200 true)
                                     (<= 0 1073741823)) (in_range
                                     temp___expr_204)))

(define-fun dynamic_invariant3 ((temp___expr_211 Int)
  (temp___is_init_207 Bool) (temp___skip_constant_208 Bool)
  (temp___do_toplevel_209 Bool)
  (temp___do_typ_inv_210 Bool)) Bool (=>
                                     (or (= temp___is_init_207 true)
                                     (<= 1 1073741823)) (in_range1
                                     temp___expr_211)))

;; size__post_axiom
  (assert
  (forall ((buffer1 us_rep))
  (! (=> (dynamic_invariant buffer1 true true true true)
     (let ((result (size buffer1)))
     (=> (size__function_guard result buffer1) (dynamic_invariant1 result
     true false true true)))) :pattern ((size buffer1)) )))

;; size__def_axiom
  (assert
  (forall ((buffer1 us_rep))
  (! (=> (dynamic_invariant buffer1 true true true true)
     (= (size buffer1) (to_rep
                       (rec__tester__ring_buffer__ring_buffer_type__count
                       (us_split_fields1 buffer1))))) :pattern ((size
                                                                buffer1)) )))

(define-fun dynamic_invariant4 ((temp___expr_197 Int)
  (temp___is_init_193 Bool) (temp___skip_constant_194 Bool)
  (temp___do_toplevel_195 Bool)
  (temp___do_typ_inv_196 Bool)) Bool (=>
                                     (or (= temp___is_init_193 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range3 temp___expr_197)))

(assert
;; defqtvc
 ;; File "generic_ring_buffer.ads", line 66, characters 0-0
  (not
  (=> (dynamic_invariant i12b true false true true)
  (=> (dynamic_invariant i12b true false true true)
  (=> (dynamic_invariant buffer true false true true)
  (=> (empty__function_guard (empty buffer) buffer)
  (=> (not (= (empty buffer) true))
  (forall ((temp___308 Int))
  (=>
  (= (to_rep1
     (rec__tester__ring_buffer__ring_buffer_type__tail
     (us_split_fields1 buffer))) temp___308)
  (<= (first1
      (rec__tester__ring_buffer__ring_buffer_type__items
      (us_split_fields1 buffer))) temp___308))))))))))
(check-sat)
(exit)
