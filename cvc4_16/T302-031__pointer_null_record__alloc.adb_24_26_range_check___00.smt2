;; produced by cvc4_16.drv ;;
(set-logic AUFBVFPDTNIRA)
(set-info :smt-lib-version 2.6)
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

(declare-sort e 0)

(declare-fun user_eq1 (e e) Bool)

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const dummy1 e)

(declare-datatypes ((e__ref 0))
(((e__refqtmk (e__content e)))))
(define-fun e__ref_e__content__projection ((a e__ref)) e (e__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__alloc__t__d integer)))))
(define-fun us_split_discrs_rec__alloc__t__d__projection ((a us_split_discrs)) integer 
  (rec__alloc__t__d a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_discrs1 us_split_discrs)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (to_rep (rec__alloc__t__d (us_split_discrs1 a))) 
                   (to_rep (rec__alloc__t__d (us_split_discrs1 b)))) true
                   false))

(define-fun in_range1 ((rec__alloc__t__d1 Int)
  (a us_split_discrs)) Bool (= rec__alloc__t__d1 (to_rep
                                                 (rec__alloc__t__d a))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const alloc__t__d__first__bit Int)

(declare-const alloc__t__d__last__bit Int)

(declare-const alloc__t__d__position Int)

;; alloc__t__d__first__bit_axiom
  (assert (<= 0 alloc__t__d__first__bit))

;; alloc__t__d__last__bit_axiom
  (assert (< alloc__t__d__first__bit alloc__t__d__last__bit))

;; alloc__t__d__position_axiom
  (assert (<= 0 alloc__t__d__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((t__ref 0))
(((t__refqtmk (t__content us_rep)))))
(define-fun t__ref_t__content__projection ((a t__ref)) us_rep (t__content a))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const alloc__t__d__first__bit1 Int)

(declare-const alloc__t__d__last__bit1 Int)

(declare-const alloc__t__d__position1 Int)

;; alloc__t__d__first__bit_axiom
  (assert (<= 0 alloc__t__d__first__bit1))

;; alloc__t__d__last__bit_axiom
  (assert (< alloc__t__d__first__bit1 alloc__t__d__last__bit1))

;; alloc__t__d__position_axiom
  (assert (<= 0 alloc__t__d__position1))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((s__ref 0))
(((s__refqtmk (s__content us_rep)))))
(define-fun s__ref_s__content__projection ((a s__ref)) us_rep (s__content a))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-datatypes ((us_split_discrs2 0))
(((us_split_discrsqtmk1 (rec__alloc__v__d integer)))))
(define-fun us_split_discrs_rec__alloc__v__d__projection ((a us_split_discrs2)) integer 
  (rec__alloc__v__d a))

(declare-datatypes ((us_split_discrs__ref1 0))
(((us_split_discrs__refqtmk1 (us_split_discrs__content1 us_split_discrs2)))))
(define-fun us_split_discrs__ref___split_discrs__content__2__projection ((a us_split_discrs__ref1)) us_split_discrs2 
  (us_split_discrs__content1 a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__alloc__v__c integer)))))
(define-fun us_split_fields_rec__alloc__v__c__projection ((a us_split_fields)) integer 
  (rec__alloc__v__c a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (us_split_discrs3 us_split_discrs2)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__2__projection ((a us_rep1)) us_split_discrs2 
  (us_split_discrs3 a))

(define-fun us_rep___split_fields__projection ((a us_rep1)) us_split_fields 
  (us_split_fields1 a))

(define-fun alloc__v__c__pred ((a us_rep1)) Bool (not
                                                 (= (to_rep
                                                    (rec__alloc__v__d
                                                    (us_split_discrs3 a))) 0)))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep (rec__alloc__v__d (us_split_discrs3 a))) 
                         (to_rep (rec__alloc__v__d (us_split_discrs3 b))))
                         (=> (alloc__v__c__pred a)
                         (= (to_rep (rec__alloc__v__c (us_split_fields1 a))) 
                         (to_rep (rec__alloc__v__c (us_split_fields1 b))))))
                    true false))

(define-fun in_range2 ((rec__alloc__v__d1 Int)
  (a us_split_discrs2)) Bool (= rec__alloc__v__d1 (to_rep
                                                  (rec__alloc__v__d a))))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const alloc__v__d__first__bit Int)

(declare-const alloc__v__d__last__bit Int)

(declare-const alloc__v__d__position Int)

;; alloc__v__d__first__bit_axiom
  (assert (<= 0 alloc__v__d__first__bit))

;; alloc__v__d__last__bit_axiom
  (assert (< alloc__v__d__first__bit alloc__v__d__last__bit))

;; alloc__v__d__position_axiom
  (assert (<= 0 alloc__v__d__position))

(declare-const alloc__v__c__first__bit Int)

(declare-const alloc__v__c__last__bit Int)

(declare-const alloc__v__c__position Int)

;; alloc__v__c__first__bit_axiom
  (assert (<= 0 alloc__v__c__first__bit))

;; alloc__v__c__last__bit_axiom
  (assert (< alloc__v__c__first__bit alloc__v__c__last__bit))

;; alloc__v__c__position_axiom
  (assert (<= 0 alloc__v__c__position))

(declare-fun user_eq4 (us_rep1 us_rep1) Bool)

(declare-const dummy4 us_rep1)

(declare-datatypes ((v__ref 0))
(((v__refqtmk (v__content us_rep1)))))
(define-fun v__ref_v__content__projection ((a v__ref)) us_rep1 (v__content a))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const alignment4 Int)

;; value__size_axiom
  (assert (<= 0 value__size4))

;; object__size_axiom
  (assert (<= 0 object__size4))

;; alignment_axiom
  (assert (<= 0 alignment4))

(declare-const alloc__v__d__first__bit1 Int)

(declare-const alloc__v__d__last__bit1 Int)

(declare-const alloc__v__d__position1 Int)

;; alloc__v__d__first__bit_axiom
  (assert (<= 0 alloc__v__d__first__bit1))

;; alloc__v__d__last__bit_axiom
  (assert (< alloc__v__d__first__bit1 alloc__v__d__last__bit1))

;; alloc__v__d__position_axiom
  (assert (<= 0 alloc__v__d__position1))

(declare-const alloc__v__c__first__bit1 Int)

(declare-const alloc__v__c__last__bit1 Int)

(declare-const alloc__v__c__position1 Int)

;; alloc__v__c__first__bit_axiom
  (assert (<= 0 alloc__v__c__first__bit1))

;; alloc__v__c__last__bit_axiom
  (assert (< alloc__v__c__first__bit1 alloc__v__c__last__bit1))

;; alloc__v__c__position_axiom
  (assert (<= 0 alloc__v__c__position1))

(declare-fun user_eq5 (us_rep1 us_rep1) Bool)

(declare-const dummy5 us_rep1)

(declare-datatypes ((f__ref 0))
(((f__refqtmk (f__content us_rep1)))))
(define-fun f__ref_f__content__projection ((a f__ref)) us_rep1 (f__content a))

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(define-fun dynamic_invariant ((temp___expr_195 us_rep)
  (temp___is_init_191 Bool) (temp___skip_constant_192 Bool)
  (temp___do_toplevel_193 Bool)
  (temp___do_typ_inv_194 Bool)) Bool (=>
                                     (not (= temp___skip_constant_192 true))
                                     (in_range1 0
                                     (us_split_discrs1 temp___expr_195))))

(define-fun default_initial_assumption ((temp___expr_197 us_rep)
  (temp___skip_top_level_198 Bool)) Bool (= (to_rep
                                            (rec__alloc__t__d
                                            (us_split_discrs1
                                            temp___expr_197))) 0))

(define-fun dynamic_invariant1 ((temp___expr_213 us_rep1)
  (temp___is_init_209 Bool) (temp___skip_constant_210 Bool)
  (temp___do_toplevel_211 Bool)
  (temp___do_typ_inv_212 Bool)) Bool (=>
                                     (not (= temp___skip_constant_210 true))
                                     (in_range2 0
                                     (us_split_discrs3 temp___expr_213))))

(define-fun default_initial_assumption1 ((temp___expr_215 us_rep1)
  (temp___skip_top_level_216 Bool)) Bool (and
                                         (= (to_rep
                                            (rec__alloc__v__d
                                            (us_split_discrs3
                                            temp___expr_215))) 0)
                                         (=> (alloc__v__c__pred
                                         temp___expr_215)
                                         (= (to_rep
                                            (rec__alloc__v__c
                                            (us_split_fields1
                                            temp___expr_215))) 0))))

(define-fun in_range3 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Bool)

(declare-datatypes ((us_rep2 0))
(((us_repqtmk2
  (rec__alloc__pe__is_null_pointer Bool)(rec__alloc__pe__pointer_address Int)(rec__alloc__pe__pointer_value e)))))
(define-fun us_rep_rec__alloc__pe__is_null_pointer__projection ((a us_rep2)) Bool 
  (rec__alloc__pe__is_null_pointer a))

(define-fun us_rep_rec__alloc__pe__pointer_address__projection ((a us_rep2)) Int 
  (rec__alloc__pe__pointer_address a))

(define-fun us_rep_rec__alloc__pe__pointer_value__projection ((a us_rep2)) e 
  (rec__alloc__pe__pointer_value a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep2)))))
(define-fun us_rep__ref___rep__content__projection ((a us_rep__ref)) us_rep2 
  (us_rep__content a))

(define-fun bool_eq2 ((a us_rep2)
  (b us_rep2)) Bool (ite (and
                         (= (rec__alloc__pe__is_null_pointer a) (rec__alloc__pe__is_null_pointer
                                                                b))
                         (=>
                         (not (= (rec__alloc__pe__is_null_pointer a) true))
                         (and
                         (= (rec__alloc__pe__pointer_address a) (rec__alloc__pe__pointer_address
                                                                b))
                         (= (rec__alloc__pe__pointer_value a) (rec__alloc__pe__pointer_value
                                                              b)))))
                    true false))

(define-fun rec__alloc__pe__pointer_value__pred ((a us_rep2)) Bool (not
                                                                   (= 
                                                                   (rec__alloc__pe__is_null_pointer
                                                                   a) true)))

(declare-const us_null_pointer us_rep2)

;; __null_pointer__def_axiom
  (assert (= (rec__alloc__pe__is_null_pointer us_null_pointer) true))

(declare-const dummy6 us_rep2)

(declare-datatypes ((pe__ref 0))
(((pe__refqtmk (pe__content us_rep2)))))
(define-fun pe__ref_pe__content__projection ((a pe__ref)) us_rep2 (pe__content
                                                                  a))

(define-fun default_initial_assumption2 ((temp___expr_223 us_rep2)
  (temp___skip_top_level_224 Bool)) Bool (= (rec__alloc__pe__is_null_pointer
                                            temp___expr_223) true))

(declare-datatypes ((us_rep3 0))
(((us_repqtmk3
  (rec__alloc__pt__is_null_pointer Bool)(rec__alloc__pt__pointer_address Int)(rec__alloc__pt__pointer_value us_rep)))))
(define-fun us_rep_rec__alloc__pt__is_null_pointer__projection ((a us_rep3)) Bool 
  (rec__alloc__pt__is_null_pointer a))

(define-fun us_rep_rec__alloc__pt__pointer_address__projection ((a us_rep3)) Int 
  (rec__alloc__pt__pointer_address a))

(define-fun us_rep_rec__alloc__pt__pointer_value__projection ((a us_rep3)) us_rep 
  (rec__alloc__pt__pointer_value a))

(declare-datatypes ((us_rep__ref1 0))
(((us_rep__refqtmk1 (us_rep__content1 us_rep3)))))
(define-fun us_rep__ref___rep__content__2__projection ((a us_rep__ref1)) us_rep3 
  (us_rep__content1 a))

(define-fun bool_eq3 ((a us_rep3)
  (b us_rep3)) Bool (ite (and
                         (= (rec__alloc__pt__is_null_pointer a) (rec__alloc__pt__is_null_pointer
                                                                b))
                         (=>
                         (not (= (rec__alloc__pt__is_null_pointer a) true))
                         (and
                         (= (rec__alloc__pt__pointer_address a) (rec__alloc__pt__pointer_address
                                                                b))
                         (= (rec__alloc__pt__pointer_value a) (rec__alloc__pt__pointer_value
                                                              b)))))
                    true false))

(define-fun rec__alloc__pt__pointer_value__pred ((a us_rep3)) Bool (not
                                                                   (= 
                                                                   (rec__alloc__pt__is_null_pointer
                                                                   a) true)))

(declare-const us_null_pointer1 us_rep3)

;; __null_pointer__def_axiom
  (assert (= (rec__alloc__pt__is_null_pointer us_null_pointer1) true))

(declare-const dummy7 us_rep3)

(declare-datatypes ((pt__ref 0))
(((pt__refqtmk (pt__content us_rep3)))))
(define-fun pt__ref_pt__content__projection ((a pt__ref)) us_rep3 (pt__content
                                                                  a))

(define-fun default_initial_assumption3 ((temp___expr_230 us_rep3)
  (temp___skip_top_level_231 Bool)) Bool (= (rec__alloc__pt__is_null_pointer
                                            temp___expr_230) true))

(declare-datatypes ((us_rep4 0))
(((us_repqtmk4
  (rec__alloc__ps__is_null_pointer Bool)(rec__alloc__ps__pointer_address Int)(rec__alloc__ps__pointer_value us_rep)))))
(define-fun us_rep_rec__alloc__ps__is_null_pointer__projection ((a us_rep4)) Bool 
  (rec__alloc__ps__is_null_pointer a))

(define-fun us_rep_rec__alloc__ps__pointer_address__projection ((a us_rep4)) Int 
  (rec__alloc__ps__pointer_address a))

(define-fun us_rep_rec__alloc__ps__pointer_value__projection ((a us_rep4)) us_rep 
  (rec__alloc__ps__pointer_value a))

(declare-datatypes ((us_rep__ref2 0))
(((us_rep__refqtmk2 (us_rep__content2 us_rep4)))))
(define-fun us_rep__ref___rep__content__3__projection ((a us_rep__ref2)) us_rep4 
  (us_rep__content2 a))

(define-fun bool_eq4 ((a us_rep4)
  (b us_rep4)) Bool (ite (and
                         (= (rec__alloc__ps__is_null_pointer a) (rec__alloc__ps__is_null_pointer
                                                                b))
                         (=>
                         (not (= (rec__alloc__ps__is_null_pointer a) true))
                         (and
                         (= (rec__alloc__ps__pointer_address a) (rec__alloc__ps__pointer_address
                                                                b))
                         (= (rec__alloc__ps__pointer_value a) (rec__alloc__ps__pointer_value
                                                              b)))))
                    true false))

(define-fun rec__alloc__ps__pointer_value__pred ((a us_rep4)) Bool (not
                                                                   (= 
                                                                   (rec__alloc__ps__is_null_pointer
                                                                   a) true)))

(declare-const us_null_pointer2 us_rep4)

;; __null_pointer__def_axiom
  (assert (= (rec__alloc__ps__is_null_pointer us_null_pointer2) true))

(declare-const dummy8 us_rep4)

(declare-datatypes ((ps__ref 0))
(((ps__refqtmk (ps__content us_rep4)))))
(define-fun ps__ref_ps__content__projection ((a ps__ref)) us_rep4 (ps__content
                                                                  a))

(define-fun dynamic_invariant2 ((temp___expr_236 us_rep4)
  (temp___is_init_232 Bool) (temp___skip_constant_233 Bool)
  (temp___do_toplevel_234 Bool)
  (temp___do_typ_inv_235 Bool)) Bool (=>
                                     (not
                                     (= (rec__alloc__ps__is_null_pointer
                                        temp___expr_236) true))
                                     (in_range1 0
                                     (us_split_discrs1
                                     (rec__alloc__ps__pointer_value
                                     temp___expr_236)))))

(define-fun default_initial_assumption4 ((temp___expr_238 us_rep4)
  (temp___skip_top_level_239 Bool)) Bool (= (rec__alloc__ps__is_null_pointer
                                            temp___expr_238) true))

(declare-datatypes ((us_rep5 0))
(((us_repqtmk5
  (rec__alloc__pv__is_null_pointer Bool)(rec__alloc__pv__pointer_address Int)(rec__alloc__pv__pointer_value us_rep1)))))
(define-fun us_rep_rec__alloc__pv__is_null_pointer__projection ((a us_rep5)) Bool 
  (rec__alloc__pv__is_null_pointer a))

(define-fun us_rep_rec__alloc__pv__pointer_address__projection ((a us_rep5)) Int 
  (rec__alloc__pv__pointer_address a))

(define-fun us_rep_rec__alloc__pv__pointer_value__projection ((a us_rep5)) us_rep1 
  (rec__alloc__pv__pointer_value a))

(declare-datatypes ((us_rep__ref3 0))
(((us_rep__refqtmk3 (us_rep__content3 us_rep5)))))
(define-fun us_rep__ref___rep__content__4__projection ((a us_rep__ref3)) us_rep5 
  (us_rep__content3 a))

(define-fun bool_eq5 ((a us_rep5)
  (b us_rep5)) Bool (ite (and
                         (= (rec__alloc__pv__is_null_pointer a) (rec__alloc__pv__is_null_pointer
                                                                b))
                         (=>
                         (not (= (rec__alloc__pv__is_null_pointer a) true))
                         (and
                         (= (rec__alloc__pv__pointer_address a) (rec__alloc__pv__pointer_address
                                                                b))
                         (= (rec__alloc__pv__pointer_value a) (rec__alloc__pv__pointer_value
                                                              b)))))
                    true false))

(define-fun rec__alloc__pv__pointer_value__pred ((a us_rep5)) Bool (not
                                                                   (= 
                                                                   (rec__alloc__pv__is_null_pointer
                                                                   a) true)))

(declare-const us_null_pointer3 us_rep5)

;; __null_pointer__def_axiom
  (assert (= (rec__alloc__pv__is_null_pointer us_null_pointer3) true))

(declare-const dummy9 us_rep5)

(declare-datatypes ((pv__ref 0))
(((pv__refqtmk (pv__content us_rep5)))))
(define-fun pv__ref_pv__content__projection ((a pv__ref)) us_rep5 (pv__content
                                                                  a))

(define-fun default_initial_assumption5 ((temp___expr_245 us_rep5)
  (temp___skip_top_level_246 Bool)) Bool (= (rec__alloc__pv__is_null_pointer
                                            temp___expr_245) true))

(declare-datatypes ((us_rep6 0))
(((us_repqtmk6
  (rec__alloc__pf__is_null_pointer Bool)(rec__alloc__pf__pointer_address Int)(rec__alloc__pf__pointer_value us_rep1)))))
(define-fun us_rep_rec__alloc__pf__is_null_pointer__projection ((a us_rep6)) Bool 
  (rec__alloc__pf__is_null_pointer a))

(define-fun us_rep_rec__alloc__pf__pointer_address__projection ((a us_rep6)) Int 
  (rec__alloc__pf__pointer_address a))

(define-fun us_rep_rec__alloc__pf__pointer_value__projection ((a us_rep6)) us_rep1 
  (rec__alloc__pf__pointer_value a))

(declare-datatypes ((us_rep__ref4 0))
(((us_rep__refqtmk4 (us_rep__content4 us_rep6)))))
(define-fun us_rep__ref___rep__content__5__projection ((a us_rep__ref4)) us_rep6 
  (us_rep__content4 a))

(define-fun bool_eq6 ((a us_rep6)
  (b us_rep6)) Bool (ite (and
                         (= (rec__alloc__pf__is_null_pointer a) (rec__alloc__pf__is_null_pointer
                                                                b))
                         (=>
                         (not (= (rec__alloc__pf__is_null_pointer a) true))
                         (and
                         (= (rec__alloc__pf__pointer_address a) (rec__alloc__pf__pointer_address
                                                                b))
                         (= (rec__alloc__pf__pointer_value a) (rec__alloc__pf__pointer_value
                                                              b)))))
                    true false))

(define-fun rec__alloc__pf__pointer_value__pred ((a us_rep6)) Bool (not
                                                                   (= 
                                                                   (rec__alloc__pf__is_null_pointer
                                                                   a) true)))

(declare-const us_null_pointer4 us_rep6)

;; __null_pointer__def_axiom
  (assert (= (rec__alloc__pf__is_null_pointer us_null_pointer4) true))

(declare-const dummy10 us_rep6)

(declare-datatypes ((pf__ref 0))
(((pf__refqtmk (pf__content us_rep6)))))
(define-fun pf__ref_pf__content__projection ((a pf__ref)) us_rep6 (pf__content
                                                                  a))

(define-fun dynamic_invariant3 ((temp___expr_251 us_rep6)
  (temp___is_init_247 Bool) (temp___skip_constant_248 Bool)
  (temp___do_toplevel_249 Bool)
  (temp___do_typ_inv_250 Bool)) Bool (=>
                                     (not
                                     (= (rec__alloc__pf__is_null_pointer
                                        temp___expr_251) true))
                                     (in_range2 0
                                     (us_split_discrs3
                                     (rec__alloc__pf__pointer_value
                                     temp___expr_251)))))

(define-fun default_initial_assumption6 ((temp___expr_253 us_rep6)
  (temp___skip_top_level_254 Bool)) Bool (= (rec__alloc__pf__is_null_pointer
                                            temp___expr_253) true))

(declare-const value__size5 Int)

(declare-const object__size5 Int)

(declare-const alignment5 Int)

;; value__size_axiom
  (assert (<= 0 value__size5))

;; object__size_axiom
  (assert (<= 0 object__size5))

;; alignment_axiom
  (assert (<= 0 alignment5))

(declare-const alloc__t__d__first__bit2 Int)

(declare-const alloc__t__d__last__bit2 Int)

(declare-const alloc__t__d__position2 Int)

;; alloc__t__d__first__bit_axiom
  (assert (<= 0 alloc__t__d__first__bit2))

;; alloc__t__d__last__bit_axiom
  (assert (< alloc__t__d__first__bit2 alloc__t__d__last__bit2))

;; alloc__t__d__position_axiom
  (assert (<= 0 alloc__t__d__position2))

(declare-fun user_eq6 (us_rep us_rep) Bool)

(declare-const dummy11 us_rep)

(declare-datatypes ((s2b__ref 0))
(((s2b__refqtmk (s2b__content us_rep)))))
(define-fun s2b__ref_s2b__content__projection ((a s2b__ref)) us_rep (s2b__content
                                                                    a))

(define-fun dynamic_invariant4 ((temp___expr_259 us_rep)
  (temp___is_init_255 Bool) (temp___skip_constant_256 Bool)
  (temp___do_toplevel_257 Bool)
  (temp___do_typ_inv_258 Bool)) Bool (=>
                                     (not (= temp___skip_constant_256 true))
                                     (in_range1 0
                                     (us_split_discrs1 temp___expr_259))))

(define-fun default_initial_assumption7 ((temp___expr_261 us_rep)
  (temp___skip_top_level_262 Bool)) Bool (= (to_rep
                                            (rec__alloc__t__d
                                            (us_split_discrs1
                                            temp___expr_261))) 0))

(declare-const value__size6 Int)

(declare-const object__size6 Int)

(declare-const alignment6 Int)

;; value__size_axiom
  (assert (<= 0 value__size6))

;; object__size_axiom
  (assert (<= 0 object__size6))

;; alignment_axiom
  (assert (<= 0 alignment6))

(declare-const alloc__v__d__first__bit2 Int)

(declare-const alloc__v__d__last__bit2 Int)

(declare-const alloc__v__d__position2 Int)

;; alloc__v__d__first__bit_axiom
  (assert (<= 0 alloc__v__d__first__bit2))

;; alloc__v__d__last__bit_axiom
  (assert (< alloc__v__d__first__bit2 alloc__v__d__last__bit2))

;; alloc__v__d__position_axiom
  (assert (<= 0 alloc__v__d__position2))

(declare-const alloc__v__c__first__bit2 Int)

(declare-const alloc__v__c__last__bit2 Int)

(declare-const alloc__v__c__position2 Int)

;; alloc__v__c__first__bit_axiom
  (assert (<= 0 alloc__v__c__first__bit2))

;; alloc__v__c__last__bit_axiom
  (assert (< alloc__v__c__first__bit2 alloc__v__c__last__bit2))

;; alloc__v__c__position_axiom
  (assert (<= 0 alloc__v__c__position2))

(declare-fun user_eq7 (us_rep1 us_rep1) Bool)

(declare-const dummy12 us_rep1)

(declare-datatypes ((s5b__ref 0))
(((s5b__refqtmk (s5b__content us_rep1)))))
(define-fun s5b__ref_s5b__content__projection ((a s5b__ref)) us_rep1 
  (s5b__content a))

(define-fun dynamic_invariant5 ((temp___expr_268 us_rep1)
  (temp___is_init_264 Bool) (temp___skip_constant_265 Bool)
  (temp___do_toplevel_266 Bool)
  (temp___do_typ_inv_267 Bool)) Bool (=>
                                     (not (= temp___skip_constant_265 true))
                                     (in_range2 0
                                     (us_split_discrs3 temp___expr_268))))

(define-fun default_initial_assumption8 ((temp___expr_270 us_rep1)
  (temp___skip_top_level_271 Bool)) Bool (and
                                         (= (to_rep
                                            (rec__alloc__v__d
                                            (us_split_discrs3
                                            temp___expr_270))) 0)
                                         (=> (alloc__v__c__pred
                                         temp___expr_270)
                                         (= (to_rep
                                            (rec__alloc__v__c
                                            (us_split_fields1
                                            temp___expr_270))) 0))))

(define-fun dynamic_invariant6 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun default_initial_assumption9 ((temp___expr_188 us_rep)
  (temp___skip_top_level_189 Bool)) Bool (= (to_rep
                                            (rec__alloc__t__d
                                            (us_split_discrs1
                                            temp___expr_188))) 0))

(define-fun default_initial_assumption10 ((temp___expr_206 us_rep1)
  (temp___skip_top_level_207 Bool)) Bool (and
                                         (= (to_rep
                                            (rec__alloc__v__d
                                            (us_split_discrs3
                                            temp___expr_206))) 0)
                                         (=> (alloc__v__c__pred
                                         temp___expr_206)
                                         (= (to_rep
                                            (rec__alloc__v__c
                                            (us_split_fields1
                                            temp___expr_206))) 0))))

(assert
;; defqtvc
 ;; File "alloc.adb", line 1, characters 0-0
  (not
  (forall ((temp___alloc_281 us_rep2) (usf e) (x__pointer_value e)
  (x__pointer_address Int) (x__is_null_pointer Bool))
  (=> (in_range 0)
  (=> (in_range 0)
  (=> (not (= (rec__alloc__pe__is_null_pointer temp___alloc_281) true))
  (=> (= (rec__alloc__pe__pointer_value temp___alloc_281) usf)
  (=> (= x__pointer_value (rec__alloc__pe__pointer_value temp___alloc_281))
  (=>
  (= x__pointer_address (rec__alloc__pe__pointer_address temp___alloc_281))
  (=>
  (= x__is_null_pointer (rec__alloc__pe__is_null_pointer temp___alloc_281))
  (in_range 0)))))))))))
(check-sat)